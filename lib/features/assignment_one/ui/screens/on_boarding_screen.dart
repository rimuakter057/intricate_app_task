import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate/app/app_color.dart';
import 'package:intricate/features/assignment_one/ui/screens/step_one_screen.dart';
import 'package:intricate/features/assignment_three/ui/screens/offline_api_screen.dart';
import 'package:intricate/features/assignment_two/ui/screens/get_product_screen.dart';

import '../../../../app/app_text_style.dart';
import '../../../../app/assets_path.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  static const String name = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: (){
                Get.toNamed(ProductScreen.name);
              }, child: Text("assignment-2")),
              SizedBox(height: 15.h),
              TextButton(onPressed: (){
                Get.toNamed(GetApiScreen.name);
              }, child: Text("assignment-3")),
              Image.asset("assets/images/on_boarding_image.png", width: 234.w,height: 220.h,),
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
      ),
    );
  }
}