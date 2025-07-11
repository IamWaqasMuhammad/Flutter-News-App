import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/onboarding_screen/widgets/onboarding_content.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding_controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.onboardingData.length,
              itemBuilder: (context, index) => OnboardContent(
                title: controller.onboardingData[index]['title']!,
                subtitle: controller.onboardingData[index]['subtitle']!,
                image: controller.onboardingData[index]['image']!,
              ),
            ),
          ),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.onboardingData.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.all(5),
                width: controller.currentPage.value == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: controller.currentPage.value == index
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          )),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: controller.skip,
                  child: const Text("Skip"),
                ),
                ElevatedButton(
                  onPressed: controller.nextPage,
                  child: Text(
                    controller.currentPage.value <
                        controller.onboardingData.length - 1
                        ? "Next"
                        : "Get Started",
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}