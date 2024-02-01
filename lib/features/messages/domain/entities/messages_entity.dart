class MessagesEntity {
  final String? chatId;
  final List<MsgItemEntity>? messages;

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

  MsgItemEntity({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.receiver,
    required this.dateTime,
    required this.message,
  });
}
