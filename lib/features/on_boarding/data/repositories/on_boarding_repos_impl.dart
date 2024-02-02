import 'package:chat_app/core/failure/failures.dart';
import 'package:chat_app/features/on_boarding/data/data_sources/on_boarding_data_sources.dart';
import 'package:chat_app/features/on_boarding/domain/repositories/on_boarding_repos.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/send_otp_usecase.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/verify_otp_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OnBoardingRepos)
@injectable
class OnBoardingReposImpl implements OnBoardingRepos {
  OnBoardingDataSource onBoardingDataSource;
  OnBoardingReposImpl(this.onBoardingDataSource);
  @override
  Future<Either<Failure, void>> sendOtp(Phone phone) async {
    try {
      final resp = await onBoardingDataSource.sendOtp(phone);
      return Right(resp);
    } catch (e) {
      return Left(Failure.apiRequestFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(Otp otp) async {
    try {
      final resp = await onBoardingDataSource.verifyOtp(otp);
      return Right(resp);
    } catch (e) {
      return Left(Failure.apiRequestFailure(e.toString()));
    }
  }
}
