class AllUsersEntity {
  final List<UserEntity> users;

  AllUsersEntity({
    required this.users,
  });
}

class UserEntity {
  final String? name;
  final String? phoneNumber;
  final String? imagePath;
  String? contactName;
  String? chatId;

  UserEntity({
    required this.name,
    required this.phoneNumber,
    required this.imagePath,
    this.contactName,
    this.chatId,
  });
}
