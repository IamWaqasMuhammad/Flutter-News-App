import '../../../constants/app_barrels/app_barrels.dart';
import '../../../controllers/onboarding_controller/onboarding_controller.dart';
import 'onboarding_content.dart';
class OnboardPagesWidget extends StatelessWidget {
  final OnboardingController controller;

  const OnboardPagesWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
