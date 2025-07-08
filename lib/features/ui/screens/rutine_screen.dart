import 'package:flutter/material.dart';
import 'package:intricate/features/ui/screens/wake_up_screen.dart';
import '../widgets/custom_progress_bar.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  static const String name = '/routine-screen';

  @override
  _RoutineScreenState createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  int selectedIndex = 3;
  int currentStep = 3;
  final int totalSteps = 5;

  final List<String> options = [
    "alm- I need something peaceful and soothing today.",
    "Energizing- I want something that will get me moving and motivated.",
    "I'm not sure- I could use either depending on the day.",
    "I don't need anything too intense right now.",
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
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProgressBar(progress: progress),
            SizedBox(height: 32),
            Text(
              "Do you prefer come or energizing routines?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Do you need a calming routine or something more energizing today?",
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
                Navigator.pushNamed(context, WakeUpScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}