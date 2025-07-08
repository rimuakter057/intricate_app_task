import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'mood_screen.dart';

class ResetPlanScreen extends StatelessWidget {
  const ResetPlanScreen({super.key});
  static const String name = '/reset-plan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Here’s your personalized\n7-day reset plan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Each day includes guided tasks to help you\nfeel better,"
                      " one moment at a time.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.name, (predicate)=> false);
                    },
                    child: const Text(
                      "View Today’s Schedule",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MoodSelectionScreen.name);
                  },
                  child: const Text(
                    "Regenerate your plan",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}