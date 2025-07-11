
import 'package:flutter/material.dart';
import 'package:flutter_news_app/bindings/splash_binding.dart';
import 'package:flutter_news_app/screens/splash%20_screen/splash_screen.dart';
import 'package:flutter_news_app/utils/app_routes/app_pages.dart';
import 'package:flutter_news_app/utils/app_routes/app_routes.dart';
import 'package:flutter_news_app/views/news_screen.dart';
import 'package:get/get.dart';

import 'constants/app_theme/app_theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages().pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
