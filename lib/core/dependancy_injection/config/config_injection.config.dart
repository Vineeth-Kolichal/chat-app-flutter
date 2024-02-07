// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/core/dependancy_injection/modules/dio_module.dart'
    as _i28;
import 'package:chat_app/core/dependancy_injection/modules/socket_io_module.dart'
    as _i29;
import 'package:chat_app/features/home/data/data_sources/home_data_sources.dart'
    as _i12;
import 'package:chat_app/features/home/data/repositories/home_repo_impl.dart'
    as _i14;
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart'
    as _i13;
import 'package:chat_app/features/home/domain/usecases/chat_usecase.dart'
    as _i24;
import 'package:chat_app/features/home/domain/usecases/initial_chat_usecase.dart'
    as _i15;
import 'package:chat_app/features/home/presentation/blocs/chats/chats_cubit.dart'
    as _i25;
import 'package:chat_app/features/messages/data/data_sources/message_data_sources.dart'
    as _i16;
import 'package:chat_app/features/messages/data/repository/message_repo_impl.dart'
    as _i18;
import 'package:chat_app/features/messages/domain/repositories/message_repo.dart'
    as _i17;
import 'package:chat_app/features/messages/domain/usecases/get_initial_messages.dart'
    as _i26;
import 'package:chat_app/features/messages/domain/usecases/message_stream_usecase.dart'
    as _i19;
import 'package:chat_app/features/messages/domain/usecases/send_message_usecase.dart'
    as _i20;
import 'package:chat_app/features/messages/presentation/blocs/cubit/message_cubit.dart'
    as _i27;
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
    as _i21;
import 'package:chat_app/features/on_boarding/presentation/blocs/set_profile/set_profile_bloc.dart'
    as _i22;
import 'package:chat_app/features/on_boarding/presentation/blocs/verify_otp/verify_otp_bloc.dart'
    as _i23;
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
    gh.lazySingleton<_i12.HomeDataSources>(() => _i12.HomeDataSourceImpl(
          gh<_i9.Socket>(),
          gh<_i3.Dio>(),
        ));
    gh.lazySingleton<_i13.HomeRepo>(
        () => _i14.HomeRepoImpl(gh<_i12.HomeDataSources>()));
    gh.lazySingleton<_i15.InitialChatUsecase>(
        () => _i15.InitialChatUsecase(gh<_i13.HomeRepo>()));
    gh.lazySingleton<_i16.MessageDataSources>(() => _i16.MessageDataSourcesImpl(
          gh<_i3.Dio>(),
          gh<_i9.Socket>(),
        ));
    gh.lazySingleton<_i17.MessageRepo>(
        () => _i18.MessageRepoImpl(gh<_i16.MessageDataSources>()));
    gh.lazySingleton<_i19.MessageStreamUsecase>(
        () => _i19.MessageStreamUsecase(gh<_i17.MessageRepo>()));
    gh.lazySingleton<_i20.SendMessageUsecase>(
        () => _i20.SendMessageUsecase(gh<_i17.MessageRepo>()));
    gh.factory<_i21.SendOtpBloc>(
        () => _i21.SendOtpBloc(gh<_i7.SendOtpUsecase>()));
    gh.factory<_i22.SetProfileBloc>(
        () => _i22.SetProfileBloc(gh<_i8.SetProfileUseCase>()));
    gh.factory<_i23.VerifyOtpBloc>(
        () => _i23.VerifyOtpBloc(gh<_i11.VerifyOtpUseCase>()));
    gh.lazySingleton<_i24.ChatUsecase>(
        () => _i24.ChatUsecase(gh<_i13.HomeRepo>()));
    gh.factory<_i25.ChatsCubit>(() => _i25.ChatsCubit(
          gh<_i24.ChatUsecase>(),
          gh<_i15.InitialChatUsecase>(),
        ));
    gh.lazySingleton<_i26.GetIntitialMessageUsecase>(
        () => _i26.GetIntitialMessageUsecase(gh<_i17.MessageRepo>()));
    gh.factory<_i27.MessageCubit>(() => _i27.MessageCubit(
          gh<_i26.GetIntitialMessageUsecase>(),
          gh<_i19.MessageStreamUsecase>(),
          gh<_i20.SendMessageUsecase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i28.DioModule {}

class _$SocketIoModule extends _i29.SocketIoModule {}
