import 'package:flutter_news_app/controllers/forget_password_controller/forget_password_controller.dart';
import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';
import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';

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
        18.pw,
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
