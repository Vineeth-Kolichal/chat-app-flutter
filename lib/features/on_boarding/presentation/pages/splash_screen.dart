import 'package:chat_app/features/home/presentation/pages/chat_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/cubit/splash_cubit.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/login_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/set_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<SplashCubit>().getNexRoute();
    });
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.nextRoute == "chat") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ChatScreen(),
              ),
            );
          } else if (state.nextRoute == "setProfile") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SetProfileScreen(),
              ),
            );
          } else if (state.nextRoute == "login") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          }
        },
        child: Center(
          child: Text("Splash"),
        ),
      ),
    );
  }
}
