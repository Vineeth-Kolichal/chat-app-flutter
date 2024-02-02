import 'package:chat_app/features/home/presentation/pages/chat_screen.dart';
import 'package:chat_app/core/dependancy_injection/config/config_injection.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/send_otp/send_otp_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/set_profile/set_profile_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/verify_otp/verify_otp_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/login_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/otp_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/set_profile_screen.dart';
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
        BlocProvider(create: (context) => SetProfileBloc()),
        BlocProvider(create: (context) => getIt<SendOtpBloc>()),
        BlocProvider(create: (context) => getIt<VerifyOtpBloc>()),
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
