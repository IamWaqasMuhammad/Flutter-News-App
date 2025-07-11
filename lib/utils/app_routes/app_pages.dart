import 'package:flutter_news_app/bindings/splash_binding.dart';
import 'package:flutter_news_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_news_app/screens/splash%20_screen/splash_screen.dart';
import 'package:flutter_news_app/utils/app_routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: AppRoutes.onboarding,
        page: () => const OnboardingScreen(),
        transition: Transition.fadeIn
    ),
  ];
}
