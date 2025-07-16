import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_barrels/app_barrels.dart';

class OrContinueWithGoogle extends StatelessWidget {
  const OrContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Column(
      children: [
        Center(
          child: Text(
            AppStringsAssets.orContinueWithText,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: CustomIconButtonWidget(
            buttonText: AppStringsAssets.googleButtonText,
            buttonColor: AppColors.button,
            buttonHeight: 50,
            buttonWidth: 350,
            borderRadius: BorderRadius.circular(8),
            onPress: controller.registerWithGoogle,
            imgUrl: AppIconsAssets.googleIcon,
            imgWidth: 30,
            imgHeight: 30,
          ),
        ),
      ],
    );
  }
}
