import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate/app/app_text_style.dart';
import 'package:intricate/features/assignment_one/ui/screens/step-three_screen.dart';
import '../widgets/custom_progress_bar.dart';

class StepTwoScreen extends StatefulWidget {
  const StepTwoScreen({super.key});

  static const String name = '/hardestPath-selection';

  @override
  _StepTwoScreenState createState() =>
      _StepTwoScreenState();
}

class _StepTwoScreenState
    extends State<StepTwoScreen> {
  int selectedIndex = 2;
  int currentStep = 2;
  final int totalSteps = 5;

  final List<String> options = [
    "Sleep- I've been struggling to get enough rest.",
    "Energy- I just don't feel energized throughout the day.",
    "Motivation- It's hard to stay focused or get started.",
    "Mood- I'm feeling emotionally drained or overwhelmed.",
  ];

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step $currentStep out of $totalSteps',
          style: AppTextStyles.stepTextStyle,
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
            SizedBox(height: 32.h),
            Text(
              "What's been hardest for you lately?",
              style: AppTextStyles.titleTextStyle,
            ),
            SizedBox(height: 8.h),
            Text(
              "Let's pinpoint what's been the most challenging for you.",
              style: AppTextStyles.bodyTextStyle,
            ),
            SizedBox(height: 24.h),
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
                  margin: EdgeInsets.symmetric(vertical: 6.w),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green[100] : Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(text,style: AppTextStyles.captionLabelTextStyle,),
                  ),
                ),
              );
            }),
            Spacer(),
            ElevatedButton(
              child: Text("Next",style: AppTextStyles.buttonTextStyle,),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Next step coming soon!")),
                );
                Navigator.pushNamed(context, StepThreeScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}