import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/on_boarding/domain/repositories/on_boarding_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class SendOtpUsecase implements UseCase<void, Phone> {
  final OnBoardingRepos onBoardingRepos;
  SendOtpUsecase(this.onBoardingRepos);
  @override
  Future<Either<Failure, void>> call(Phone params) {
    return onBoardingRepos.sendOtp(params);
  }
}

class Phone {
  final String phoneNumber;
  Phone({required this.phoneNumber});
}
