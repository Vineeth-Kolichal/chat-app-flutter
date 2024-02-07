import 'dart:async';

import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/core/network_and_exceptions/custom_exception.dart';
import 'package:chat_app/features/home/data/models/chat_list_model.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:socket_io_client/socket_io_client.dart";

abstract class HomeDataSources {
  Future<Stream<List<Chat>>> getChatStream();
  Future<List<Chat>> getChatList();
}

@LazySingleton(as: HomeDataSources)
@injectable
class HomeDataSourceImpl implements HomeDataSources {
  Dio dio;
  static late String phone;
  final Socket socket;

  HomeDataSourceImpl(this.socket, this.dio);
  @override
  Future<Stream<List<Chat>>> getChatStream() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    phone = shared.getString('phone')!;
    try {
      final controller = StreamController<List<Chat>>();
      socket.on("chats", (data) {
        final dta = ChatModel.fromJson(data);
        if (phone == dta.phone) {
          controller.sink.add(dta.chatList);
        }
      });
      return controller.stream;
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }

  @override
  Future<List<Chat>> getChatList() async {
    try {
      SharedPreferences shared = await SharedPreferences.getInstance();
      phone = shared.getString('phone')!;
      final token = shared.getString('token');
      final resp = await dio.get(ApiEndpoints.getChats,
          data: {"phone": phone},
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      final chat = ChatModel.fromJson(resp.data);
      return chat.chatList;
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }
}
