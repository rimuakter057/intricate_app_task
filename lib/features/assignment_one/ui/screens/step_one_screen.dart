import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate/app/app_text_style.dart';
import 'package:intricate/features/assignment_one/ui/screens/step_two_screen.dart';
import '../widgets/custom_progress_bar.dart';


class StepOneScreen extends StatefulWidget {
  const StepOneScreen({super.key});

  static const String name = '/mood-selection';

  @override
  _StepOneScreenState createState() => _StepOneScreenState();
}

class _StepOneScreenState extends State<StepOneScreen> {
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
          icon:  Icon(Icons.arrow_back_ios_new, size: 16.sp, color: Color(0xFF5A55CA)),
          label: const Text(
            'Back',
            style: TextStyle(
              color: Color(0xFF5A55CA),
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.transparent,
            padding:  EdgeInsets.only(left: 12.w),
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Center(
              child: Text(
                'Step $currentStep out of $totalSteps',
                style: AppTextStyles.stepTextStyle,
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
            SizedBox(height: 32.h),
            Text(
              'How are you feeling today?',
              style: AppTextStyles.titleTextStyle,
            ),
            SizedBox(height: 8.h),
            Text(
              "Let's understand how you're feeling today.",
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
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ListTile(
                    title: Text(text,style: AppTextStyles.captionLabelTextStyle,),
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
                  Navigator.pushNamed(context, StepTwoScreen.name);
                },
                child: Text("Next",style:AppTextStyles.buttonTextStyle ,)),
          ],
        ),
      ),
    );
  }
}