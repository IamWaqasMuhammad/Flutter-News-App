

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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OnboardingDotsWidgets(controller: controller),
                  OnboardBackAndNextButtons(controller: controller),
                ],
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
