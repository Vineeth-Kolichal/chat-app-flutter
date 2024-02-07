import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/domain/entities/all_users_entity.dart';
import 'package:chat_app/features/home/domain/entities/chat_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, Stream<List<Chat>>>> getChatStream();
  Future<Either<Failure, List<Chat>>> getIntialChats();
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
}
