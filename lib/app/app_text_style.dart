
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intricate/app/app_color.dart';

class AppTextStyles {
  static final TextStyle buttonTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,  // বা FontWeight.w500
    fontSize: 14.sp,           // XXL (responsive)
    color: AppColors.white,
  );

  static final TextStyle stepTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,  // Regular
    fontSize: 14.sp,
    color: AppColors.themeColor,
  );

  static final TextStyle titleTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,  // Medium
    fontSize: 20.sp,
    color: AppColors.titleTextColor,
  );

  static final TextStyle bodyTextStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,     // Regular
    fontSize: 14.sp,          // Example: dynamic font size (approx. 14.28.sp)
    color: AppColors.bodyTextColor,             // চাইলে AppColors.black ও দিতে পারো
  );

  static final TextStyle captionLabelTextStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,     // Regular
    fontSize: (100 / 7).sp,          // Example: dynamic font size (approx. 14.28.sp)
    color: AppColors.commonTextColor,             // চাইলে AppColors.black ও দিতে পারো
  );

  static final TextStyle headlineTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,       // SemiBold
    fontSize: 22.sp,     // ≈ 8.33.sp
    color: AppColors.commonTextColor,                 // চাইলে AppColors.black ইউজ করতে পারো
  );


}


