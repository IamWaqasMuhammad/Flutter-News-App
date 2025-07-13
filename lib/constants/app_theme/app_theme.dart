import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';

class AppTheme {
  /// LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.titleActive,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.titleActive),
    ),
    iconTheme: const IconThemeData(color: AppColors.titleActive),
    dividerColor: Colors.grey.shade300,
    cardColor: Colors.white,
    dialogTheme: const DialogThemeData(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: AppColors.titleActive),
      contentTextStyle: TextStyle(color: AppColors.bodyText),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.bodyText,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.disabledInput,
      hintStyle: TextStyle(color: AppColors.placeholder),
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  );

  /// DARK THEME
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTitle,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkTitle),
    ),
    iconTheme: const IconThemeData(color: AppColors.darkTitle),
    dividerColor: Colors.grey.shade800,
    cardColor: AppColors.darkInput,
    dialogTheme:  DialogThemeData(
      backgroundColor: AppColors.darkInput,
      titleTextStyle: TextStyle(color: AppColors.darkTitle),
      contentTextStyle: TextStyle(color: AppColors.darkBody),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkInput,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.darkBody,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkInput,
      hintStyle: TextStyle(color: AppColors.placeholder),
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  );
}
