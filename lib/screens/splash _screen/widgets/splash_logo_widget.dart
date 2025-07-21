

import '../../../constants/app_barrels/app_barrels.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PNGImagesWidget(
      imageUrl: AppIconsAssets.appIcon,
      height: 150,
      width: 150,
    );
  }
}
