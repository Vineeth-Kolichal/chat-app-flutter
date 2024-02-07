import 'package:chat_app/features/messages/data/models/messages_model.dart';

class MessagesEntity {
  final String? chatId;
  final List<MsgItemModel> messages;

  MessagesEntity({
    required this.chatId,
    this.messages = const [],
  });
}

class MsgItemEntity {
  final String? id;
  final String? chatId;
  final String? sender;
  final String? receiver;
  final DateTime? dateTime;
  final String? message;
  String? phoneNum;

  MsgItemEntity(
      {required this.id,
      required this.chatId,
      required this.sender,
      required this.receiver,
      required this.dateTime,
      required this.message,
      required this.phoneNum});
}
