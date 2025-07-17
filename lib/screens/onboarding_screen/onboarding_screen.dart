import 'package:flutter_news_app/screens/onboarding_screen/widgets/onbaord_back_and_next_buttons.dart';
import 'package:flutter_news_app/screens/onboarding_screen/widgets/onboard_pages_widget.dart';
import 'package:flutter_news_app/screens/onboarding_screen/widgets/onboarding_dots_widgets.dart';

import '../../constants/app_barrels/app_barrels.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      body: Column(
        children: [
          OnboardPagesWidget(controller: controller),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OnboardingDotsWidgets(controller: controller),
                  OnboardBackAndNextButtons(controller: controller),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
