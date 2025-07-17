import 'package:flutter_news_app/controllers/forget_password_controller/forget_password_controller.dart';
import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';

import '../../../constants/app_barrels/app_barrels.dart';

class ForgetTextFieldWidget extends StatelessWidget {
  final ForgotPasswordController controller;
  const ForgetTextFieldWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppStringsAssets.emailLabel,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 14,
                  color: AppColors.placeholder,
                ),
              ),
              TextSpan(
                text: AppStringsAssets.asterak,
                style: const TextStyle(color: AppColors.error),
              ),
            ],
          ),
        ),
        5.ph,
        // ✅ Email Text Field
        CustomTextFieldWidget(
          controller: controller.emailController,
          focusNode: controller.emailFocusNode,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => controller.sendResetEmail(),
        ),

        40.ph
      ],
    );
  }
}
