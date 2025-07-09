
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intricate/features/assignment_one/ui/screens/splash_screen.dart';
import 'package:intricate/features/assignment_two/ui/screens/get_product_screen.dart';

import 'app_color.dart';
import 'app_routes.dart';


class IntricateApp extends StatelessWidget {
  const IntricateApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(375, 812),//figma base size
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(double.maxFinite, 48.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)
              ),
              foregroundColor: Colors.white,
              backgroundColor: AppColors.buttonColor
          ),
        ),
      ),
      initialRoute:SplashScreen.name,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      //initialBinding: ControllerBinder(),
    );
  }
    );
  }
}