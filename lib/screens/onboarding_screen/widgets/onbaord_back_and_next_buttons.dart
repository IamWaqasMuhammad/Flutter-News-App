import '../../../constants/app_barrels/app_barrels.dart';

class OnboardBackAndNextButtons extends StatelessWidget {
  final OnboardingController controller;

  const OnboardBackAndNextButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButtonWidget(
          buttonText: AppStringsAssets.backButtonText,
          onPress: controller.backPage,
          buttonWidth: 50,
          buttonHeight: 40,
          borderRadius: BorderRadius.circular(10),
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 12, color: AppColors.buttonText),
        ),
        SizedBox(
          width: 20,
        ),
        CustomButtonWidget(
          buttonHeight: 40,
          buttonWidth: 90,
          borderRadius: BorderRadius.circular(10),
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 12, color: AppColors.disabledInput),
          buttonText: controller.currentPage.value <
                  controller.onboardingData.length - 1
              ? AppStringsAssets.nextButtonText
              : AppStringsAssets.getStartedButtonText,
          onPress: controller.nextPage,
          buttonColor: AppColors.primary,
        ),
      ],
    );
  }
}
