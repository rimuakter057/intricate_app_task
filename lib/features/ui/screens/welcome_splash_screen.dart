import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/assets_path.dart';
import 'mood_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String name = '/welcome-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsPath.welcomeImage, width: 120),
            SizedBox(height: 32),
            Text(
              'Your Journey to a Better\nMind Starts Here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We’re here to help you build daily routines\nthat restore balance, joy, and strength —\none step at a time.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MoodSelectionScreen.name);
              },
              child: Text(
                'Get Started – Free 3-Day Trial',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}