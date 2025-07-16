import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_barrels/app_barrels.dart';

class SignupRememberMe extends StatelessWidget {
  const SignupRememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Row(
      children: [
        Obx(() => Checkbox(
          value: controller.rememberMe.value,
          onChanged: controller.toggleRememberMe,
          activeColor: AppColors.primary,
          checkColor: AppColors.darkTitle,
        )),
        Text(
          AppStringsAssets.rememberMeCheck,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
