import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const OnboardingScreen()); // replace with your next screen
    });
  }
}