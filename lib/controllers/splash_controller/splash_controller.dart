


import '../../constants/app_barrels/app_barrels.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.onboarding);
    });
  }
}
