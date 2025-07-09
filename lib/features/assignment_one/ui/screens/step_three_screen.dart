import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate/app/app_text_style.dart';

import '../widgets/custom_progress_bar.dart';

class StepThreeScreen extends StatefulWidget {
  const StepThreeScreen({super.key});

  static const String name = '/routine-screen';

  @override
  _StepThreeScreenState createState() => _StepThreeScreenState();
}

class _StepThreeScreenState extends State<StepThreeScreen> {
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
              "Do you prefer come or energizing routines?",
              style: AppTextStyles.titleTextStyle,
            ),
            SizedBox(height: 8.h),
            Text(
              "Do you need a calming routine or something more energizing today?",
              style: AppTextStyles.bodyTextStyle,
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
                    title: Text(text,style: AppTextStyles.captionLabelTextStyle,),
                  ),
                ),
              );
            }),
            Spacer(),
            ElevatedButton(
              child: Text("Next",style: AppTextStyles.buttonTextStyle,),
              onPressed: () {
                Navigator.pushNamed(context, StepThreeScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}