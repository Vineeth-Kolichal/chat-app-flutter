import 'package:chat_app/features/messages/data/models/messages_model.dart';
import 'package:chat_app/features/messages/domain/usecases/get_initial_messages.dart';
import 'package:chat_app/features/messages/domain/usecases/message_stream_usecase.dart';
import 'package:chat_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'message_state.dart';
part 'message_cubit.freezed.dart';

@injectable
class MessageCubit extends Cubit<MessageState> {
  TextEditingController msgController = TextEditingController();
  final GetIntitialMessageUsecase getIntitialMessageUsecase;
  final MessageStreamUsecase messageStreamUsecase;
  final SendMessageUsecase sendMessageUsecase;
  MessageCubit(
    this.getIntitialMessageUsecase,
    this.messageStreamUsecase,
    this.sendMessageUsecase,
  ) : super(MessageState.initial());

  Future<void> getIntialMessages(String chatId) async {
    final resp = await getIntitialMessageUsecase(ChatIdParam(chatId: chatId));
    final newState = resp.fold((fail) {
      return state.copyWith(error: fail.error);
    }, (msgList) {
      return state.copyWith(messages: msgList.reversed.toList(), error: null);
    });
    emit(newState);
  }

  Future<void> getMessages(String chatId) async {
    final resp = await messageStreamUsecase(ChatIdParam(chatId: chatId));
    resp.fold((fail) {
      emit(state.copyWith(error: fail.error));
    }, (msgStream) {
      msgStream.listen((msgs) {
        emit(state.copyWith(messages: msgs.reversed.toList()));
      });
    });
  }

  Future<void> sendMessage(
      {required String chatId, required String user2}) async {
    if (msgController.text.isNotEmpty) {
      final resp = await sendMessageUsecase(MessageParam(
          chatId: chatId, user2: user2, message: msgController.text.trim()));
      msgController.clear();
      resp.fold((fail) {
        emit(state.copyWith(error: fail.error));
      }, (_) => null);
    }
  }
}
