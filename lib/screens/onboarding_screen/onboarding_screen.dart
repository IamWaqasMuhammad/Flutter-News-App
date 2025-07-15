

import '../../constants/app_barrels/app_barrels.dart';

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
                      CustomButtonWidget(
                        buttonText: AppStringsAssets.backButtonText,
                        onPress: controller.backPage,
                        buttonWidth: 50,
                        buttonHeight: 40,
                        borderRadius: BorderRadius.circular(10),
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: AppColors.buttonText
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButtonWidget(
                        buttonHeight: 40,
                        buttonWidth: 90,
                        borderRadius: BorderRadius.circular(10),
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          color: AppColors.disabledInput
                      ),
                        buttonText: controller.currentPage.value <
                                controller.onboardingData.length - 1
                            ? AppStringsAssets.nextButtonText
                            : AppStringsAssets.getStartedButtonText,
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
