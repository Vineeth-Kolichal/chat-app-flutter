import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/core/network_and_exceptions/custom_exception.dart';
import 'package:chat_app/features/messages/data/data_sources/message_data_sources.dart';
import 'package:chat_app/features/messages/data/models/messages_model.dart';
import 'package:chat_app/features/messages/domain/repositories/message_repo.dart';
import 'package:chat_app/features/messages/domain/usecases/get_initial_messages.dart';
import 'package:chat_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MessageRepo)
@injectable
class MessageRepoImpl implements MessageRepo {
  MessageDataSources dataSources;
  MessageRepoImpl(this.dataSources);
  @override
  Future<Either<Failure, List<MsgItemModel>>> getInitialMessages(
      ChatIdParam params) async {
    try {
      final msgList = await dataSources.getInitialMessages(params);
      return Right(msgList);
    } on CustomException catch (e) {
      return Left(Failure.apiRequestFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Stream<List<MsgItemModel>>>> getMessageStream(
      ChatIdParam params) async {
    try {
      final msgStream = await dataSources.getMsgStream(params);
      return Right(msgStream);
    } on CustomException catch (e) {
      return Left(Failure.apiRequestFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(MessageParam params) async {
    try {
      final resp = await dataSources.sendMessage(params);
      return Right(resp);
    } on CustomException catch (e) {
      return Left(Failure.apiRequestFailure(e.message));
    }
  }
}
