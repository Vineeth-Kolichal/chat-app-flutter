import 'package:chat_app/features/home/presentation/pages/chat_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/bloc/set_profile_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/login_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/otp_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/set_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SetProfileBloc(),
        )
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
        home: const LoginScreen(),
      ),
    );
  }
}
