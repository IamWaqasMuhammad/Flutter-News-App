import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/app_barrels/app_barrels.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigation();
  }

  void navigation() {
    Future.delayed(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offNamed(AppRoutes.main);
      } else {
        Get.offNamed(AppRoutes.onboarding);
      }
    });
  }
}
