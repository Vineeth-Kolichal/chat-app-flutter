// To parse this JSON data, do
//
//     final messages = messagesFromJson(jsonString);

// import 'dart:convert';

// Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));

// String messagesToJson(Messages data) => json.encode(data.toJson());

import 'package:chat_app/features/messages/domain/entities/messages_entity.dart';

class MessagesModel extends MessagesEntity {
  MessagesModel({
    required super.chatId,
    super.messages,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        chatId: json["chatId"],
        messages: List<MsgItemModel>.from(
            json["messages"].map((x) => MsgItemModel.fromJson(x))),
      );
}

class MsgItemModel extends MsgItemEntity {
  MsgItemModel(
      {required super.id,
      required super.chatId,
      required super.sender,
      required super.receiver,
      required super.dateTime,
      required super.message,
      required super.phoneNum});

  factory MsgItemModel.fromJson(Map<String, dynamic> json) => MsgItemModel(
      id: json["_id"],
      chatId: json["chatId"],
      sender: json["sender"],
      receiver: json["receiver"],
      dateTime: DateTime.parse(json["dateTime"]),
      message: json["message"],
      phoneNum: null);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chatId": chatId,
        "sender": sender,
        "receiver": receiver,
        "dateTime": dateTime?.toIso8601String(),
        "message": message,
      };
}
