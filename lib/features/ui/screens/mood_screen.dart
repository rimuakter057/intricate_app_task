import 'package:flutter/material.dart';
import '../widgets/custom_progress_bar.dart';
import 'chalengis_screen.dart';

class MoodSelectionScreen extends StatefulWidget {
  const MoodSelectionScreen({super.key});

  static const String name = '/mood-selection';

  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  int selectedIndex = 1;
  int currentStep = 1;
  final int totalSteps = 5;

  final List<String> options = [
    "I'm feeling good!",
    "I'm okay, not great, not bad.",
    "I'm feeling a bit low.",
    "I'm feeling really down today.",
  ];

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF5A55CA)),
          label: const Text(
            'Back',
            style: TextStyle(
              color: Color(0xFF5A55CA),
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.transparent,
            padding: const EdgeInsets.only(left: 12),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                'Step $currentStep out of $totalSteps',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5A55CA),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProgressBar(progress: progress),
            SizedBox(height: 32),
            Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Let's understand how you're feeling today.",
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Next step coming soon!")),
                  );
                  Navigator.pushNamed(context, ChallengingPathSelectionScreen.name);
                },
                child: const Text("Next")),
          ],
        ),
      ),
    );
  }
}