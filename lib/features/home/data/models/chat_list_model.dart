import 'package:chat_app/features/home/domain/entities/chat_list_entity.dart';

import 'chat_model.dart';

class ChatModel extends ChatListEntity {
  ChatModel({
    required super.phone,
    super.chatList = const [],
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        phone: json["phone"],
        chatList:
            List<Chat>.from(json["chatList"].map((x) => Chat.fromJson(x))),
      );
}
