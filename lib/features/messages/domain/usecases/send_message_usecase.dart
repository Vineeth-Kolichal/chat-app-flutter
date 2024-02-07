import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/messages/domain/repositories/message_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class SendMessageUsecase implements UseCase<void, MessageParam> {
  MessageRepo repo;
  SendMessageUsecase(this.repo);
  @override
  Future<Either<Failure, void>> call(MessageParam params) {
    return repo.sendMessage(params);
  }
}

class MessageParam {
  final String chatId;
  String? user1;
  final String user2;
  final String message;
  DateTime time = DateTime.now();

  MessageParam({
    required this.chatId,
    this.user1,
    required this.user2,
    required this.message,
  });
  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "user1": user1,
        "user2": user2,
        "message": message,
        "time": time.toIso8601String(),
      };
}
