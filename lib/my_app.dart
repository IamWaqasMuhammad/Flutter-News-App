import 'package:api_testing/constants/app_theme/app_theme.dart';
import 'package:api_testing/views/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: NewsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}