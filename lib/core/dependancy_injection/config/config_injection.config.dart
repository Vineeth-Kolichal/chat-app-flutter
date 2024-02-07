// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/core/dependancy_injection/modules/dio_module.dart'
    as _i31;
import 'package:chat_app/core/dependancy_injection/modules/socket_io_module.dart'
    as _i32;
import 'package:chat_app/features/home/data/data_sources/fetch_contacts.dart'
    as _i4;
import 'package:chat_app/features/home/data/data_sources/home_data_sources.dart'
    as _i13;
import 'package:chat_app/features/home/data/repositories/home_repo_impl.dart'
    as _i15;
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart'
    as _i14;
import 'package:chat_app/features/home/domain/usecases/chat_usecase.dart'
    as _i25;
import 'package:chat_app/features/home/domain/usecases/get_all_users_usecase.dart'
    as _i27;
import 'package:chat_app/features/home/domain/usecases/initial_chat_usecase.dart'
    as _i16;
import 'package:chat_app/features/home/presentation/blocs/bloc/users_bloc.dart'
    as _i30;
import 'package:chat_app/features/home/presentation/blocs/chats/chats_cubit.dart'
    as _i26;
import 'package:chat_app/features/messages/data/data_sources/message_data_sources.dart'
    as _i17;
import 'package:chat_app/features/messages/data/repository/message_repo_impl.dart'
    as _i19;
import 'package:chat_app/features/messages/domain/repositories/message_repo.dart'
    as _i18;
import 'package:chat_app/features/messages/domain/usecases/get_initial_messages.dart'
    as _i28;
import 'package:chat_app/features/messages/domain/usecases/message_stream_usecase.dart'
    as _i20;
import 'package:chat_app/features/messages/domain/usecases/send_message_usecase.dart'
    as _i21;
import 'package:chat_app/features/messages/presentation/blocs/message_cubit/message_cubit.dart'
    as _i29;
import 'package:chat_app/features/on_boarding/data/data_sources/on_boarding_data_sources.dart'
    as _i5;
import 'package:chat_app/features/on_boarding/data/repositories/on_boarding_repos_impl.dart'
    as _i7;
import 'package:chat_app/features/on_boarding/domain/repositories/on_boarding_repos.dart'
    as _i6;
import 'package:chat_app/features/on_boarding/domain/usecase/send_otp_usecase.dart'
    as _i8;
import 'package:chat_app/features/on_boarding/domain/usecase/set_profile_usecase.dart'
    as _i9;
import 'package:chat_app/features/on_boarding/domain/usecase/verify_otp_usecase.dart'
    as _i12;
import 'package:chat_app/features/on_boarding/presentation/blocs/cubit/splash_cubit.dart'
    as _i11;
import 'package:chat_app/features/on_boarding/presentation/blocs/send_otp/send_otp_bloc.dart'
    as _i22;
import 'package:chat_app/features/on_boarding/presentation/blocs/set_profile/set_profile_bloc.dart'
    as _i23;
import 'package:chat_app/features/on_boarding/presentation/blocs/verify_otp/verify_otp_bloc.dart'
    as _i24;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:socket_io_client/socket_io_client.dart' as _i10;

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
    gh.lazySingleton<_i4.FetchContact>(() => _i4.FetchContact());
    gh.lazySingleton<_i5.OnBoardingDataSource>(
        () => _i5.OnBoardingDataSourceImpl(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.OnBoardingRepos>(
        () => _i7.OnBoardingReposImpl(gh<_i5.OnBoardingDataSource>()));
    gh.lazySingleton<_i8.SendOtpUsecase>(
        () => _i8.SendOtpUsecase(gh<_i6.OnBoardingRepos>()));
    gh.lazySingleton<_i9.SetProfileUseCase>(
        () => _i9.SetProfileUseCase(gh<_i6.OnBoardingRepos>()));
    gh.lazySingleton<_i10.Socket>(() => socketIoModule.socket);
    gh.factory<_i11.SplashCubit>(() => _i11.SplashCubit(gh<_i10.Socket>()));
    gh.lazySingleton<_i12.VerifyOtpUseCase>(
        () => _i12.VerifyOtpUseCase(gh<_i6.OnBoardingRepos>()));
    gh.lazySingleton<_i13.HomeDataSources>(() => _i13.HomeDataSourceImpl(
          gh<_i10.Socket>(),
          gh<_i3.Dio>(),
          gh<_i4.FetchContact>(),
        ));
    gh.lazySingleton<_i14.HomeRepo>(
        () => _i15.HomeRepoImpl(gh<_i13.HomeDataSources>()));
    gh.lazySingleton<_i16.InitialChatUsecase>(
        () => _i16.InitialChatUsecase(gh<_i14.HomeRepo>()));
    gh.lazySingleton<_i17.MessageDataSources>(() => _i17.MessageDataSourcesImpl(
          gh<_i3.Dio>(),
          gh<_i10.Socket>(),
        ));
    gh.lazySingleton<_i18.MessageRepo>(
        () => _i19.MessageRepoImpl(gh<_i17.MessageDataSources>()));
    gh.lazySingleton<_i20.MessageStreamUsecase>(
        () => _i20.MessageStreamUsecase(gh<_i18.MessageRepo>()));
    gh.lazySingleton<_i21.SendMessageUsecase>(
        () => _i21.SendMessageUsecase(gh<_i18.MessageRepo>()));
    gh.factory<_i22.SendOtpBloc>(
        () => _i22.SendOtpBloc(gh<_i8.SendOtpUsecase>()));
    gh.factory<_i23.SetProfileBloc>(
        () => _i23.SetProfileBloc(gh<_i9.SetProfileUseCase>()));
    gh.factory<_i24.VerifyOtpBloc>(
        () => _i24.VerifyOtpBloc(gh<_i12.VerifyOtpUseCase>()));
    gh.lazySingleton<_i25.ChatUsecase>(
        () => _i25.ChatUsecase(gh<_i14.HomeRepo>()));
    gh.factory<_i26.ChatsCubit>(() => _i26.ChatsCubit(
          gh<_i25.ChatUsecase>(),
          gh<_i16.InitialChatUsecase>(),
        ));
    gh.lazySingleton<_i27.GetAllUsersUsecase>(
        () => _i27.GetAllUsersUsecase(gh<_i14.HomeRepo>()));
    gh.lazySingleton<_i28.GetIntitialMessageUsecase>(
        () => _i28.GetIntitialMessageUsecase(gh<_i18.MessageRepo>()));
    gh.factory<_i29.MessageCubit>(() => _i29.MessageCubit(
          gh<_i28.GetIntitialMessageUsecase>(),
          gh<_i20.MessageStreamUsecase>(),
          gh<_i21.SendMessageUsecase>(),
        ));
    gh.factory<_i30.UsersBloc>(
        () => _i30.UsersBloc(gh<_i27.GetAllUsersUsecase>()));
    return this;
  }
}

class _$DioModule extends _i31.DioModule {}

class _$SocketIoModule extends _i32.SocketIoModule {}
