// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/core/dependancy_injection/modules/dio_module.dart'
    as _i20;
import 'package:chat_app/core/dependancy_injection/modules/socket_io_module.dart'
    as _i21;
import 'package:chat_app/features/home/data/data_sources/home_data_sources.dart'
    as _i12;
import 'package:chat_app/features/home/data/repositories/home_repo_impl.dart'
    as _i14;
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart'
    as _i13;
import 'package:chat_app/features/home/domain/usecases/chat_usecase.dart'
    as _i18;
import 'package:chat_app/features/home/presentation/blocs/chats/chats_cubit.dart'
    as _i19;
import 'package:chat_app/features/on_boarding/data/data_sources/on_boarding_data_sources.dart'
    as _i4;
import 'package:chat_app/features/on_boarding/data/repositories/on_boarding_repos_impl.dart'
    as _i6;
import 'package:chat_app/features/on_boarding/domain/repositories/on_boarding_repos.dart'
    as _i5;
import 'package:chat_app/features/on_boarding/domain/usecase/send_otp_usecase.dart'
    as _i7;
import 'package:chat_app/features/on_boarding/domain/usecase/set_profile_usecase.dart'
    as _i8;
import 'package:chat_app/features/on_boarding/domain/usecase/verify_otp_usecase.dart'
    as _i11;
import 'package:chat_app/features/on_boarding/presentation/blocs/cubit/splash_cubit.dart'
    as _i10;
import 'package:chat_app/features/on_boarding/presentation/blocs/send_otp/send_otp_bloc.dart'
    as _i15;
import 'package:chat_app/features/on_boarding/presentation/blocs/set_profile/set_profile_bloc.dart'
    as _i16;
import 'package:chat_app/features/on_boarding/presentation/blocs/verify_otp/verify_otp_bloc.dart'
    as _i17;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:socket_io_client/socket_io_client.dart' as _i9;

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
    gh.lazySingleton<_i8.SetProfileUseCase>(
        () => _i8.SetProfileUseCase(gh<_i5.OnBoardingRepos>()));
    gh.lazySingleton<_i9.Socket>(() => socketIoModule.socket);
    gh.factory<_i10.SplashCubit>(() => _i10.SplashCubit(gh<_i9.Socket>()));
    gh.lazySingleton<_i11.VerifyOtpUseCase>(
        () => _i11.VerifyOtpUseCase(gh<_i5.OnBoardingRepos>()));
    gh.lazySingleton<_i12.HomeDataSources>(
        () => _i12.HomeDataSourceImpl(gh<_i9.Socket>()));
    gh.lazySingleton<_i13.HomeRepo>(
        () => _i14.HomeRepoImpl(gh<_i12.HomeDataSources>()));
    gh.factory<_i15.SendOtpBloc>(
        () => _i15.SendOtpBloc(gh<_i7.SendOtpUsecase>()));
    gh.factory<_i16.SetProfileBloc>(
        () => _i16.SetProfileBloc(gh<_i8.SetProfileUseCase>()));
    gh.factory<_i17.VerifyOtpBloc>(
        () => _i17.VerifyOtpBloc(gh<_i11.VerifyOtpUseCase>()));
    gh.lazySingleton<_i18.ChatUsecase>(
        () => _i18.ChatUsecase(gh<_i13.HomeRepo>()));
    gh.factory<_i19.ChatsCubit>(() => _i19.ChatsCubit(gh<_i18.ChatUsecase>()));
    return this;
  }
}

class _$DioModule extends _i20.DioModule {}

class _$SocketIoModule extends _i21.SocketIoModule {}
