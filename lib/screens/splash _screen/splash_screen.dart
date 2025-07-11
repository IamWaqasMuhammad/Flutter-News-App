


import '../../constants/app_linkers/app_linkers.dart';

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
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: PNGImages(
                imageUrl: AppImagesAssets().appLogo,
                size: Responsive.height(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
