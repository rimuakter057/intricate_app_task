import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intricate/app/app_color.dart';

import 'on_boarding_screen.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const name = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, OnBoardingScreen.name, (predicate) => false);
    });
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Text(
          'INTRICATE',
          style:GoogleFonts.poppins(
            color:AppColors.white,
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
            letterSpacing: 0,
        ),
        ),
      ),
    );
  }
}