import 'package:flutter/material.dart';
import 'package:intricate/features/ui/screens/welcome_splash_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const name = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, WelcomeScreen.name, (predicate) => false);
    });
    return Scaffold(
      backgroundColor: const Color(0xFF2B2E6C),
      body: Center(
        child: Text(
          'INTRICATE',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}