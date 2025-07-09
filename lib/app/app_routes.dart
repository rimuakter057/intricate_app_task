import 'package:flutter/material.dart';
import 'package:intricate/features/assignment_one/ui/screens/step-three_screen.dart';
import 'package:intricate/features/assignment_one/ui/screens/step_four_screen.dart';
import 'package:intricate/features/assignment_one/ui/screens/step_one_screen.dart';
import 'package:intricate/features/assignment_three/ui/screens/offline_api_screen.dart';
import 'package:intricate/features/assignment_two/ui/screens/get_product_screen.dart';

import '../features/assignment_one/ui/screens/home_screen.dart';
import '../features/assignment_one/ui/screens/on_boarding_screen.dart';
import '../features/assignment_one/ui/screens/reset_screen.dart';
import '../features/assignment_one/ui/screens/splash_screen.dart';
import '../features/assignment_one/ui/screens/step_two_screen.dart';



class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    }
    else if (settings.name == OnBoardingScreen.name) {
      route = const OnBoardingScreen();
    }
    else if (settings.name == StepOneScreen.name) {
      route =  StepOneScreen();
    }
    else if (settings.name == StepTwoScreen.name) {
      route = StepTwoScreen();
    }
    else if (settings.name == StepThreeScreen.name) {
      route = StepThreeScreen();
    }
    else if (settings.name == StepFourScreen.name) {
      route = StepFourScreen();
    }
    else if (settings.name == ProductScreen.name) {
      route = ProductScreen();
    }
    else if (settings.name == GetApiScreen.name) {
      route = GetApiScreen();
    }
    else if (settings.name == ResetPlanScreen.name) {
      route = ResetPlanScreen();
    }
    else if (settings.name == HomeScreen.name) {
      route = HomeScreen();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}