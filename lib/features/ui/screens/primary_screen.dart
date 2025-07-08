import 'package:flutter/material.dart';
import 'package:intricate/features/ui/screens/reset_screen.dart';
import '../widgets/custom_progress_bar.dart';

class PrimaryGoalScreen extends StatefulWidget {
  const PrimaryGoalScreen({super.key});

  static const String name = '/primary-goal-screen';

  @override
  _PrimaryGoalScreenState createState() => _PrimaryGoalScreenState();
}

class _PrimaryGoalScreenState extends State<PrimaryGoalScreen> {
  int selectedIndex = 5;
  int currentStep = 5;
  final int totalSteps = 5;

  final List<String> options = [
    "Find Calm- I am looking for a ways to relax and manage stress.",
    "Increase Energy- I need help to boosting my motivation and energy levels.",
    "improve Focus- I want to get back to a more focused, productivity state.",
    "Overall Wellness- I just want to feel better and take care of natural health.",
  ];

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step $currentStep out of $totalSteps',
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        //padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProgressBar(progress: progress),
            SizedBox(height: 32),
            Text(
              "What's your primary goal for using this app'?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Let's focus on what you want to achieve",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 24),
            ...options.asMap().entries.map((entry) {
              int idx = entry.key;
              String text = entry.value;
              bool isSelected = idx == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = idx;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green[100] : Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(text),
                  ),
                ),
              );
            }),
            Spacer(),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                Navigator.pushNamed(context, ResetPlanScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}