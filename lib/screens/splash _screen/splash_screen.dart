

import '../../constants/app_barrels/app_barrels.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogoWidget(),
            20.height,
            SplashAppNameTaglineTextWidget(),
            SplashLoadingWidget(controller: controller),
          ],
        ),
      ),
    );
  }
}
