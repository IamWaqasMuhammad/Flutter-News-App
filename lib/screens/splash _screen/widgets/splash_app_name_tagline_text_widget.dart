import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../constants/app_barrels/app_barrels.dart';

class SplashAppNameTaglineTextWidget extends StatelessWidget {
  const SplashAppNameTaglineTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStringsAssets.appName,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 44,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        10.ph,
        // Animated tagline
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              AppStringsAssets.splashtagLineText,
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
        30.ph,

      ],
    );
  }
}
