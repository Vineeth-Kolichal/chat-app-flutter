import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/messages/data/models/messages_model.dart';
import 'package:chat_app/features/messages/domain/repositories/message_repo.dart';
import 'package:chat_app/features/messages/domain/usecases/get_initial_messages.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class MessageStreamUsecase
    implements UseCase<Stream<List<MsgItemModel>>, ChatIdParam> {
  MessageRepo repo;
  MessageStreamUsecase(this.repo);
  @override
  Future<Either<Failure, Stream<List<MsgItemModel>>>> call(ChatIdParam params) {
    return repo.getMessageStream(params);
  }
}
