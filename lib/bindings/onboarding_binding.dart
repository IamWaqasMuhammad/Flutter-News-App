
import 'package:flutter_news_app/controllers/onboarding_controller/onboarding_controller.dart';

import '../constants/app_linkers/app_linkers.dart';


class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}

