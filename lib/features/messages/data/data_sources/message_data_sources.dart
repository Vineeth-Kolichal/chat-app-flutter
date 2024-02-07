import 'dart:async';

import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/core/network_and_exceptions/custom_exception.dart';
import 'package:chat_app/features/messages/data/models/messages_model.dart';
import 'package:chat_app/features/messages/domain/usecases/get_initial_messages.dart';
import 'package:chat_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class MessageDataSources {
  Future<List<MsgItemModel>> getInitialMessages(ChatIdParam param);
  Future<Stream<List<MsgItemModel>>> getMsgStream(ChatIdParam param);
  Future<void> sendMessage(MessageParam param);
}

@LazySingleton(as: MessageDataSources)
@injectable
class MessageDataSourcesImpl implements MessageDataSources {
  final Dio dio;
  final Socket socket;
  static late SharedPreferences shared;
  String? phone;
  MessageDataSourcesImpl(this.dio, this.socket);
  @override
  Future<List<MsgItemModel>> getInitialMessages(ChatIdParam param) async {
    shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    phone = shared.getString('phone');
    try {
      final resp = await dio.get(ApiEndpoints.getMessages,
          data: {"chatId": "65bb7d122546cf42da289f42"},
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      final MessagesModel messagesModel = MessagesModel.fromJson(resp.data);
      List<MsgItemModel> msgList = messagesModel.messages;
      msgList = msgList.map((e) {
        e.phoneNum = phone;
        return e;
      }).toList();
      return msgList;
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }

  @override
  Future<Stream<List<MsgItemModel>>> getMsgStream(ChatIdParam param) async {
    final controller = StreamController<List<MsgItemModel>>();
    try {
      socket.on("messages", (data) {
        final dta = MessagesModel.fromJson(data);
        if (param.chatId == dta.chatId) {
          List<MsgItemModel> msgList = dta.messages;
          msgList = msgList.map((e) {
            e.phoneNum = phone;
            return e;
          }).toList();
          controller.sink.add(msgList);
        }
      });
      return controller.stream;
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }

  @override
  Future<void> sendMessage(MessageParam param) async {
    try {
      param.user1 = shared.getString('phone');
      socket.emit("messages", param.toJson());
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }
}
