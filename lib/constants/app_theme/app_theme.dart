import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/responsive.dart';
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
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: TextStyle(
        color: AppColors.titleActive,
        fontSize: Responsive.font(28),
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.bodyText,
        fontSize: Responsive.font(18),
      ),
      labelLarge: TextStyle(
        color: AppColors.buttonText,
        fontSize: Responsive.font(14),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.placeholder),
      filled: true,
      fillColor: AppColors.disabledInput,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
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
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ).copyWith(
      titleLarge: TextStyle(
        color: AppColors.darkTitle,
        fontSize: Responsive.font(28),
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.darkBody,
        fontSize: Responsive.font(18),
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: Responsive.font(14),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.placeholder),
      filled: true,
      fillColor: AppColors.darkInput,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
    ),
  );
}
