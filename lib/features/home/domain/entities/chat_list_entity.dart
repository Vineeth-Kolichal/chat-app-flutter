import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/domain/entities/chat_entity.dart';

class ChatListEntity {
  final String? phone;
  final List<Chat> chatList;

  ChatListEntity({
    required this.phone,
    this.chatList = const [],
  });
}
