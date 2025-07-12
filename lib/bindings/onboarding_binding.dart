
import 'package:flutter_news_app/controllers/onboarding_controller/onboarding_controller.dart';

import '../constants/app_barrels/app_barrels.dart';




class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}

