import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/send_otp_usecase.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/set_profile_usecase.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/verify_otp_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class OnBoardingRepos {
  Future<Either<Failure, void>> sendOtp(Phone phone);
  Future<Either<Failure, void>> verifyOtp(Otp otp);
  Future<Either<Failure, void>> setProfile(ProfileParam param);
}
