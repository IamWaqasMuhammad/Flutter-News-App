import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_barrels/app_barrels.dart';
import '../../constants/app_icons/app_icons_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();

    return Scaffold(
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PNGImagesWidget(
              imageUrl: AppIconsAssets.appIcon,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
             Text(
              "Khabar App",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 44,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Animated tagline
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Your Daily Dose of Verified News",
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18),
                  speed: const Duration(milliseconds: 70),
                ),
              ],
              totalRepeatCount: 1, // Run only once (or set to infinite)
              pause: const Duration(milliseconds: 500),
              displayFullTextOnTap: true,
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 30),

            // Loading spinner (animated switch for smoother UX)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.isChecking.value
                  ? const CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2,
              )
                  : null,
            ),
          ],
        )),
      ),
    );
  }
}
