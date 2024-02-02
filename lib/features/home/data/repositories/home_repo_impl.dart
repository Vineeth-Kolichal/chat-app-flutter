import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/home/data/data_sources/home_data_sources.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/domain/entities/chat_entity.dart';
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepo)
@injectable
class HomeRepoImpl implements HomeRepo {
  final HomeDataSources homeDataSources;

  HomeRepoImpl(this.homeDataSources);
  @override
  Future<Either<Failure, Stream<List<Chat>>>> getChatStream() async {
    try {
      final data = await homeDataSources.getChatStream();
      return Right(data);
    } catch (e) {
      return Left(Failure.apiRequestFailure(e.toString()));
    }
  }
}
