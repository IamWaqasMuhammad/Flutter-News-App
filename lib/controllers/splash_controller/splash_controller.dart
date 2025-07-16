import 'dart:math';
import 'package:http/http.dart' as http;
import '../../constants/app_barrels/app_barrels.dart';

class SplashController extends GetxController {
  final isChecking = true.obs;
  final logicDelay = 3.obs;

  @override
  void onInit() {
    super.onInit();
    startSplashFlow();
  }

  void startSplashFlow() async {
    isChecking.value = true;

    int? internetSpeed;

    // Keep checking until internet is available
    while (internetSpeed == null) {
      internetSpeed = await measureInternetSpeed();

      if (internetSpeed == null) {
        Get.snackbar(
          "No Internet Connection",
          "Please turn on internet first.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.error,
          colorText: Get.theme.colorScheme.onError,
          duration: const Duration(seconds: 3),
        );

        await Future.delayed(const Duration(seconds: 3));
      }
    }

    // 🐢 Show snackbar for weak internet (if speed > 2 seconds)
    if (internetSpeed > 2) {
      Get.snackbar(
        "Weak Internet",
        "Your internet connection is weak.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.secondary,
        colorText: Get.theme.colorScheme.onSecondary,
        duration: const Duration(seconds: 3),
      );
    }

    final deviceSpeed = measureDeviceSpeed();
    int total = (internetSpeed + deviceSpeed).clamp(2, 6);
    logicDelay.value = total;

    await Future.delayed(Duration(seconds: logicDelay.value));
    isChecking.value = false;

    final user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(milliseconds: 500));

    if (user != null) {
      Get.offNamed(AppRoutes.main);
    } else {
      Get.offNamed(AppRoutes.onboarding);
    }
  }

  Future<int?> measureInternetSpeed() async {
    final stopwatch = Stopwatch()..start();
    try {
      final response = await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 4));

      if (response.statusCode != 200) return null;
    } catch (_) {
      return null;
    } finally {
      stopwatch.stop();
    }

    int delay = (stopwatch.elapsedMilliseconds ~/ 1000).clamp(1, 4);
    return delay;
  }

  int measureDeviceSpeed() {
    final stopwatch = Stopwatch()..start();
    final random = Random();
    final List<int> list = List.generate(10000, (_) => random.nextInt(10000));
    list.sort();
    stopwatch.stop();
    return (stopwatch.elapsedMilliseconds ~/ 1000).clamp(1, 3);
  }
}
