import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/on_boarding/domain/repositories/on_boarding_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class VerifyOtpUseCase implements UseCase<void, Otp> {
  final OnBoardingRepos repos;

  VerifyOtpUseCase(this.repos);
  @override
  Future<Either<Failure, void>> call(Otp params) {
    return repos.verifyOtp(params);
  }
}

class Otp {
  final String otp;
  final String phone;

  Otp(this.otp, this.phone);
}
