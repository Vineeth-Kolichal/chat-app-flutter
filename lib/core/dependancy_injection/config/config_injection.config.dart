// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/core/dependancy_injection/modules/dio_module.dart'
    as _i12;
import 'package:chat_app/core/dependancy_injection/modules/socket_io_module.dart'
    as _i13;
import 'package:chat_app/features/on_boarding/data/data_sources/on_boarding_data_sources.dart'
    as _i4;
import 'package:chat_app/features/on_boarding/data/repositories/on_boarding_repos_impl.dart'
    as _i6;
import 'package:chat_app/features/on_boarding/domain/repositories/on_boarding_repos.dart'
    as _i5;
import 'package:chat_app/features/on_boarding/domain/usecase/send_otp_usecase.dart'
    as _i7;
import 'package:chat_app/features/on_boarding/domain/usecase/verify_otp_usecase.dart'
    as _i9;
import 'package:chat_app/features/on_boarding/presentation/blocs/send_otp/send_otp_bloc.dart'
    as _i10;
import 'package:chat_app/features/on_boarding/presentation/blocs/verify_otp/verify_otp_bloc.dart'
    as _i11;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:socket_io_client/socket_io_client.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final socketIoModule = _$SocketIoModule();
    gh.lazySingleton<_i3.Dio>(() => dioModule.dioInstance);
    gh.lazySingleton<_i4.OnBoardingDataSource>(
        () => _i4.OnBoardingDataSourceImpl(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.OnBoardingRepos>(
        () => _i6.OnBoardingReposImpl(gh<_i4.OnBoardingDataSource>()));
    gh.lazySingleton<_i7.SendOtpUsecase>(
        () => _i7.SendOtpUsecase(gh<_i5.OnBoardingRepos>()));
    gh.lazySingleton<_i8.Socket>(() => socketIoModule.socket);
    gh.lazySingleton<_i9.VerifyOtpUseCase>(
        () => _i9.VerifyOtpUseCase(gh<_i5.OnBoardingRepos>()));
    gh.factory<_i10.SendOtpBloc>(
        () => _i10.SendOtpBloc(gh<_i7.SendOtpUsecase>()));
    gh.factory<_i11.VerifyOtpBloc>(
        () => _i11.VerifyOtpBloc(gh<_i9.VerifyOtpUseCase>()));
    return this;
  }
}

class _$DioModule extends _i12.DioModule {}

class _$SocketIoModule extends _i13.SocketIoModule {}
