
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app_color.dart';
import 'app_routes.dart';


class IntricateApp extends StatelessWidget {
  const IntricateApp({super.key});
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor:Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              foregroundColor: Colors.white,
              backgroundColor: AppColors.themeColor
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      //initialBinding: ControllerBinder(),
    );






    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'intricate App',
    //   home: GetApiScreen(),
    // );
  }
}