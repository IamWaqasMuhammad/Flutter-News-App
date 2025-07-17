import '../../../constants/app_barrels/app_barrels.dart';

class OnboardingDotsWidgets extends StatelessWidget {

  final OnboardingController controller;

   const OnboardingDotsWidgets({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<OnboardingController>();

    return Row(
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
    );
  }
}
