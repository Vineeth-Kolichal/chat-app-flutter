// To parse this JSON data, do
//
//     final messages = messagesFromJson(jsonString);

// import 'dart:convert';

// Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));

// String messagesToJson(Messages data) => json.encode(data.toJson());

class MessagesEntity {
  final String? chatId;
  final List<MsgItemEntity>? messages;

  MessagesEntity({
    required this.chatId,
    this.messages = const [],
  });

  factory MessagesEntity.fromJson(Map<String, dynamic> json) => MessagesEntity(
        chatId: json["chatId"],
        messages: List<MsgItemEntity>.from(
            json["messages"].map((x) => MsgItemEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "messages": List<dynamic>.from(messages!.map((x) => x.toJson())),
      };
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

  factory MsgItemEntity.fromJson(Map<String, dynamic> json) => MsgItemEntity(
        id: json["_id"],
        chatId: json["chatId"],
        sender: json["sender"],
        receiver: json["receiver"],
        dateTime: DateTime.parse(json["dateTime"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chatId": chatId,
        "sender": sender,
        "receiver": receiver,
        "dateTime": dateTime?.toIso8601String(),
        "message": message,
      };
}
