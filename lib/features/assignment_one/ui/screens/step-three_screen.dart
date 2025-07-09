import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate/app/app_text_style.dart';
import 'package:intricate/features/assignment_one/ui/screens/step_four_screen.dart';
import '../widgets/custom_progress_bar.dart';

class StepThreeScreen extends StatefulWidget {
  const StepThreeScreen({super.key});

  static const String name = '/wake-up-screen';

  @override
  _StepThreeScreenState createState() => _StepThreeScreenState();
}

class _StepThreeScreenState extends State<StepThreeScreen> {
  int selectedIndex = 4;
  int currentStep = 4;
  final int totalSteps = 5;

  final List<String> options = [
    "6:00 AM- I start my day early.",
    "7:00 AM- I woke up around this time.",
    "8:00 AM- I usually get up a bit later.",
    "I'm night owl- I tend to wake yp around 9:00 AM or later'.",
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
              "What time do you usually wake up?",
              style: AppTextStyles.titleTextStyle,
            ),
            SizedBox(height: 8.h),
            Text(
              "Your wake-up time help us create a balanced routine?",
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
              child: Text("Next",style: AppTextStyles.bodyTextStyle,),
              onPressed: () {
                Navigator.pushNamed(context, StepFourScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}