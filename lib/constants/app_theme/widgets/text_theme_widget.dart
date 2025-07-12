
import '../../app_barrels/app_barrels.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        fontSize: 24
    ),
    bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.bodyText,
        fontSize: 22
    ),
    bodyMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: AppColors.titleActive,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500,
      color: Colors.black45,
      fontSize: 16,
    ),
    labelMedium: GoogleFonts.ubuntu(
      color: Colors.black26,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );

  /// DARK TEXT THEME
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        fontSize: 24
    ),
    bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.bodyText,
        fontSize: 22
    ),
    bodyMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: AppColors.darkBody,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500,
      color: Colors.white54,
      fontSize: 16,
    ),
    labelMedium: GoogleFonts.ubuntu(
      color: AppColors.placeholder,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}