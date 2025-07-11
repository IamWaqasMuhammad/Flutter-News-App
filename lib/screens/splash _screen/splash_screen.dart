// lib/screens/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_news_app/config/responsive.dart';
import 'package:flutter_news_app/constants/app_images/app_images_assets.dart';
import 'package:flutter_news_app/widgets/svg_images.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SVGImages(
              imageUrl: AppImagesAssets().appLogo,
              size: Responsive.height(25),
            ),
            SizedBox(height: 20),
            Text(
              'Khabar App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
