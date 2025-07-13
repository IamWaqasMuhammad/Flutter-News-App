

import 'package:flutter_news_app/bindings/onboarding_binding.dart';
import 'package:flutter_news_app/screens/login_screen/login_screen.dart';
import 'package:flutter_news_app/screens/main_screen/main_screen.dart';
import 'package:flutter_news_app/screens/signup_screen/singup_screen.dart';

import '../../constants/app_barrels/app_barrels.dart';


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
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        // binding: OnboardingBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: AppRoutes.signup,
        page: () => const SignupScreen(),
        // binding: OnboardingBinding(),
        transition: Transition.fadeIn
    ),
  ];
}
