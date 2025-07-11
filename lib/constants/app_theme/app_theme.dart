


import '../app_linkers/app_linkers.dart';

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
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: AppColors.titleActive,
        fontSize: Responsive.font(28),
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.bodyText,
        fontSize: Responsive.font(18),
        fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
          color: AppColors.bodyText,
          fontSize: Responsive.font(18),
          fontWeight: FontWeight.w400
      ),
      labelLarge: TextStyle(
        color: AppColors.buttonText,
        fontSize: Responsive.font(14),
        fontWeight: FontWeight.w500
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
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: TextStyle(
        color: AppColors.titleActive,
        fontSize: Responsive.font(28),
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: AppColors.titleActive,
        fontSize: Responsive.font(28),
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
          color: AppColors.bodyText,
          fontSize: Responsive.font(18),
          fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
          color: AppColors.bodyText,
          fontSize: Responsive.font(18),
          fontWeight: FontWeight.w400
      ),
      labelLarge: TextStyle(
          color: AppColors.buttonText,
          fontSize: Responsive.font(14),
          fontWeight: FontWeight.w500
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
