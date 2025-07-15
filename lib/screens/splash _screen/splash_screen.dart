



import 'package:flutter_news_app/constants/app_icons/app_icons_assets.dart';

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
            PNGImagesWidget(
              imageUrl: AppIconsAssets.appIcon,
              height: 300,
              width: 300,
            ),
            const CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
