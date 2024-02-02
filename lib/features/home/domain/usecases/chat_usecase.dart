import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/domain/entities/chat_entity.dart';
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class ChatUsecase implements UseCase<Stream<List<Chat>>, NoParams> {
  final HomeRepo repo;

  ChatUsecase(this.repo);
  @override
  Future<Either<Failure, Stream<List<Chat>>>> call(NoParams params) {
    return repo.getChatStream();
  }
}
