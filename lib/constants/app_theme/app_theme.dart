import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.titleActive,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.titleActive),
      bodyLarge: TextStyle(color: AppColors.bodyText),
      labelLarge: TextStyle(color: AppColors.buttonText),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.placeholder),
      filled: true,
      fillColor: AppColors.disabledInput,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: AppColors.primary,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTitle,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.darkTitle),
      bodyLarge: TextStyle(color: AppColors.darkBody),
      labelLarge: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.placeholder),
      filled: true,
      fillColor: AppColors.darkInput,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: AppColors.primary,
      ),
    ),
  );
}
