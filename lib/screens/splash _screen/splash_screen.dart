// lib/screens/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_news_app/config/responsive.dart';
import 'package:flutter_news_app/constants/app_images/app_images_assets.dart';
import 'package:flutter_news_app/constants/app_theme/app_theme.dart';
import 'package:flutter_news_app/widgets/png_images.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("SplashScreen built with controller: $controller");

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
