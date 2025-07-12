import 'package:flutter/material.dart';
import 'package:flutter_news_app/constants/app_colors/app_colors.dart';
import 'package:flutter_news_app/screens/onboarding_screen/widgets/onboarding_content.dart';
import 'package:flutter_news_app/widgets/custom_button.dart';
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
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  ),
                  Row(
                    children: [
                      CustomButton(
                        buttonText: 'Back',
                        onPress: controller.backPage,
                        buttonWidth: 70,
                        buttonHeight: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButton(
                        buttonHeight: 40,
                        buttonWidth: 100,
                        borderRadius: BorderRadius.circular(10),
                        buttonText: controller.currentPage.value <
                                controller.onboardingData.length - 1
                            ? 'Next'
                            : 'Get Started',
                        onPress: controller.nextPage,
                        buttonColor: AppColors.primary,
                      ),
                    ],
                  )
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
