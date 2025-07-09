import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate/app/app_color.dart';
import 'package:intricate/app/app_text_style.dart';
import 'package:intricate/features/assignment_one/ui/screens/step_one_screen.dart';
import 'home_screen.dart';


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
                 Text(
                  "Here’s your personalized\n7-day reset plan.",
                  textAlign: TextAlign.center,
                  style:AppTextStyles.headlineTextStyle,
                ),
                const SizedBox(height: 16),
                 Text(
                  "Each day includes guided tasks to help you\nfeel better,"
                      " one moment at a time.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,       // Regular
                    fontSize: (100 / 8).sp,      // ≈ 12.5.sp
                    color: AppColors.commonTextColor,               // চাইলে AppColors.black
                  ),
                ),
                 SizedBox(height: 40.h),
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
                    Navigator.pushNamed(context, StepOneScreen.name);
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