import 'package:flutter/material.dart';
import '../features/ui/screens/chalengis_screen.dart';
import '../features/ui/screens/home_screen.dart';
import '../features/ui/screens/mood_screen.dart';
import '../features/ui/screens/primary_screen.dart';
import '../features/ui/screens/reset_screen.dart';
import '../features/ui/screens/rutine_screen.dart';
import '../features/ui/screens/splash_screen.dart';
import '../features/ui/screens/wake_up_screen.dart';
import '../features/ui/screens/welcome_splash_screen.dart';


class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    }  else if (settings.name == WelcomeScreen.name) {
      route = const WelcomeScreen();
    } else if (settings.name == MoodSelectionScreen.name) {
      route =  MoodSelectionScreen();
    } else if (settings.name == ChallengingPathSelectionScreen.name) {
      route = ChallengingPathSelectionScreen();
    } else if (settings.name == RoutineScreen.name) {
      route = RoutineScreen();
    } else if (settings.name == WakeUpScreen.name) {
      route = WakeUpScreen();
    } else if (settings.name == PrimaryGoalScreen.name) {
      route = PrimaryGoalScreen();
    } else if (settings.name == ResetPlanScreen.name) {
      route = ResetPlanScreen();
    } else if (settings.name == HomeScreen.name) {
      route = HomeScreen();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}