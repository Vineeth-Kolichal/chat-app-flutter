import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/home/domain/entities/all_users_entity.dart';
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class GetAllUsersUsecase implements UseCase<List<UserEntity>, NoParams> {
  final HomeRepo repo;

  GetAllUsersUsecase(this.repo);
  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) {
    return repo.getAllUsers();
  }
}
