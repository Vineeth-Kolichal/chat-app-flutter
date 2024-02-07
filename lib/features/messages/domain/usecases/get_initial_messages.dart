import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/messages/data/models/messages_model.dart';
import 'package:chat_app/features/messages/domain/repositories/message_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class GetIntitialMessageUsecase
    implements UseCase<List<MsgItemModel>, ChatIdParam> {
  MessageRepo repo;
  GetIntitialMessageUsecase(this.repo);
  @override
  Future<Either<Failure, List<MsgItemModel>>> call(ChatIdParam params) {
    return repo.getInitialMessages(params);
  }
}

class ChatIdParam {
  final String chatId;

  ChatIdParam({required this.chatId});
}
