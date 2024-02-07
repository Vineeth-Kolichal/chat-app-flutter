import 'package:chat_app/features/home/presentation/blocs/chats/chats_cubit.dart';
import 'package:chat_app/core/dependancy_injection/config/config_injection.dart';
import 'package:chat_app/features/messages/presentation/blocs/message_cubit/message_cubit.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/cubit/splash_cubit.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/send_otp/send_otp_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/set_profile/set_profile_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/verify_otp/verify_otp_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SetProfileBloc>()),
        BlocProvider(create: (context) => getIt<SendOtpBloc>()),
        BlocProvider(create: (context) => getIt<VerifyOtpBloc>()),
        BlocProvider(create: (context) => getIt<SplashCubit>()),
        BlocProvider(create: (context) => getIt<ChatsCubit>()),
        BlocProvider(create: (context) => getIt<MessageCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue))),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
