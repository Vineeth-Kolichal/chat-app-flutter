import 'package:chat_app/features/home/domain/entities/chat_entity.dart';

class Chat extends ChatEntity {
  Chat({
    required super.id,
    required super.lastMsgDate,
    required super.name,
    required super.phoneNumber,
    required super.imagePath,
    required super.cName,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        lastMsgDate: DateTime.parse(json["lastMsgDate"]),
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        imagePath: json["imagePath"],
        cName: json["cName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "lastMsgDate": lastMsgDate?.toIso8601String(),
        "name": name,
        "phoneNumber": phoneNumber,
        "imagePath": imagePath,
        "cName": cName,
      };
}
