



import '../../constants/app_barrels/app_barrels.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    debugPrint("SplashScreen built with controller: $controller");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PNGImages(
              imageUrl: AppImagesAssets().appLogo,
              height: 300,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
