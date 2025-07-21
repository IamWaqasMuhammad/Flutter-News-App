

import '../../../../constants/app_barrels/app_barrels.dart';

class LoginRememberAndForgot extends StatelessWidget {
   const LoginRememberAndForgot({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Row(
      children: [
        Obx(
              () => Checkbox(
            value: controller.rememberMe.value,
            onChanged: controller.toggleRememberMe,
            activeColor: AppColors.primary,
            checkColor: AppColors.darkTitle,
          ),
        ),
        Text(
          AppStringsAssets.rememberMeCheck,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: 14,
          ),
        ),
        18.width,
        CustomButtonWidget(
          buttonText: AppStringsAssets.forgetButtonText,
          onPress: ()=>Get.toNamed(AppRoutes.forget),
          buttonHeight: 20,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
