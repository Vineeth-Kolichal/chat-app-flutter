import 'package:chat_app/features/home/domain/entities/all_users_entity.dart';

class AllUsersModel extends AllUsersEntity {
  AllUsersModel({
    required super.users,
  });

  factory AllUsersModel.fromJson(Map<String, dynamic> json) => AllUsersModel(
        users: List<UserModel>.from(
            json["users"].map((x) => UserModel.fromJson(x))),
      );
}

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.phoneNumber,
    required super.imagePath,
    super.contactName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "imagePath": imagePath,
      };
}
