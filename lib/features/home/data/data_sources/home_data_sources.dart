import 'dart:async';

import 'package:chat_app/core/network_and_exceptions/custom_exception.dart';
import 'package:chat_app/features/home/data/models/chat_list_model.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:socket_io_client/socket_io_client.dart";

abstract class HomeDataSources {
  Future<Stream<List<Chat>>> getChatStream();
  void getAllChats();
}

@LazySingleton(as: HomeDataSources)
@injectable
class HomeDataSourceImpl implements HomeDataSources {
  static late String phone;
  final Socket socket;

  HomeDataSourceImpl(this.socket);
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
  void getAllChats() {
    socket.emit('getChats');
  }
}
