import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate/app/app_color.dart';
import 'package:intricate/features/assignment_one/ui/screens/step_one_screen.dart';

import '../../../../app/app_text_style.dart';
import '../../../../app/assets_path.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  static const String name = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding:  EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsPath.onboardingImage, width: 234.w,height: 220.h,),
            SizedBox(height: 32.h),
        Text(
        'Your Journey to a Better\nMind Starts Here.',
        textAlign: TextAlign.center,
        style: AppTextStyles.headlineTextStyle,
      ),

      SizedBox(height: 8.h),

            Text(
              'We’re here to help you build daily routines\nthat restore balance, joy, and strength —\none step at a time.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14.sp,       // screen_utils এর responsive font size
                fontWeight: FontWeight.normal, // Regular weight
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 64.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, StepOneScreen.name);
              },
              child:Text(
                'Get Started – Free 3-Day Trial',
                style: AppTextStyles.buttonTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}