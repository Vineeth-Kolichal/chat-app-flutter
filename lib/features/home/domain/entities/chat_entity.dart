class ChatEntity {
  final String? id;
  final DateTime? lastMsgDate;
  final String? name;
  final String? phoneNumber;
  final String? imagePath;
  final String? cName;

  ChatEntity({
    required this.id,
    required this.lastMsgDate,
    required this.name,
    required this.phoneNumber,
    required this.imagePath,
    required this.cName,
  });
}