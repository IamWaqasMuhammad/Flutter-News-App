

import 'package:flutter_news_app/bindings/country_picker_binding/country_picker_binding.dart';

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
        binding: LoginBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: AppRoutes.signup,
        page: () => const SignupScreen(),
        binding: SignupBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: AppRoutes.forget,
        page: () => const ForgotPasswordScreen(),
        binding: ForgetPasswordBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: AppRoutes.country,
        page: () => const CountryScreen(),
        binding: CountryPickerBinding(),
        transition: Transition.fadeIn
    ),
  ];
}
