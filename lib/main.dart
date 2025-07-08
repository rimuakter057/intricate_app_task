import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/ui/get_api_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts App',
      home: GetApiScreen(),
    );
  }
}
