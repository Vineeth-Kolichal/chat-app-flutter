import 'package:chat_app/features/home/presentation/pages/chat_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/login_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/set_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences shared = await SharedPreferences.getInstance();
      final token = shared.getString('token');
      final profile = shared.getBool('profile');
      Future.delayed(const Duration(seconds: 3), () {
        if (token != null) {
          if (profile != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ChatScreen(),
              ),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SetProfileScreen(),
              ),
            );
          }
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      });
    });
    return Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
