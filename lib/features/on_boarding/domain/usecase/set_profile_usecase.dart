import 'dart:io';

import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/on_boarding/domain/repositories/on_boarding_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class SetProfileUseCase implements UseCase<void, ProfileParam> {
  final OnBoardingRepos onBoardingRepos;

  SetProfileUseCase(this.onBoardingRepos);
  @override
  Future<Either<Failure, void>> call(ProfileParam params) {
    return onBoardingRepos.setProfile(params);
  }
}

class ProfileParam {
  File? image;
  final String name;
  ProfileParam({required this.name, this.image});
}
