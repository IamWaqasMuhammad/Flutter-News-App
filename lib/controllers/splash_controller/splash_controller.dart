import 'dart:math';
import 'package:http/http.dart' as http;
import '../../constants/app_barrels/app_barrels.dart';

class SplashController extends GetxController {
  final isChecking = true.obs;
  final logicDelay = 3.obs; // Renamed for clarity

  @override
  void onInit() {
    super.onInit();
    startSplashFlow();
  }

  void startSplashFlow() async {
    isChecking.value = true;

    // Run both delay checks in parallel
    final results = await Future.wait([
      measureInternetSpeed(),
      Future(() => measureDeviceSpeed()),
    ]);

    int total = (results[0] + results[1]).clamp(2, 6);
    logicDelay.value = total;

    // Wait a total delay (for spinner effect)
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

  Future<int> measureInternetSpeed() async {
    final stopwatch = Stopwatch()..start();
    try {
      await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 2));
    } catch (_) {
      return 2; // Fallback delay
    } finally {
      stopwatch.stop();
    }
    return (stopwatch.elapsedMilliseconds ~/ 1000).clamp(1, 3);
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

