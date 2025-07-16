import 'package:connectivity_plus/connectivity_plus.dart';
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

    while (!await isInternetAvailable()) {
      Get.snackbar(
        "No Internet Connection",
        "Please turn on internet first.",
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        icon: Icon(Icons.wifi_off_outlined),
        shouldIconPulse: true,
      );

      await Future.delayed(const Duration(seconds: 3));
    }

    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      Get.snackbar(
        "Weak Internet",
        "Mobile data may be slower than Wi-Fi.",
        backgroundColor: Colors.orange.withOpacity(0.5),
        colorText: Colors.black,
        duration: const Duration(seconds: 3),
        icon: Icon(Icons.network_wifi_1_bar),
        shouldIconPulse: true,
      );
    }

    logicDelay.value = 3;
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

  Future<bool> isInternetAvailable() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return false;

    try {
      final result = await http.get(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 3));
      return result.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
