import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/messages/data/models/messages_model.dart';
import 'package:chat_app/features/messages/domain/usecases/get_initial_messages.dart';
import 'package:chat_app/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class MessageRepo {
  Future<Either<Failure, List<MsgItemModel>>> getInitialMessages(
      ChatIdParam params);
  Future<Either<Failure, Stream<List<MsgItemModel>>>> getMessageStream(
      ChatIdParam params);
  Future<Either<Failure, void>> sendMessage(MessageParam params);
}
