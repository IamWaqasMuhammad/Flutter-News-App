

import 'package:flutter_news_app/bindings/onboarding_binding.dart';

import '../../constants/app_linkers/app_linkers.dart';

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
        binding: OnboardingBinding(),
        transition: Transition.fadeIn
    ),
  ];
}
