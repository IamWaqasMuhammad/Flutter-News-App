

import '../../../../constants/app_barrels/app_barrels.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection(LoginController controller,{super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email Field
          _buildLabel(context, AppStringsAssets.emailLabel),
          5.ph,
          CustomTextFieldWidget(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            controller: controller.emailController,
            focusNode: controller.emailFocus,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(controller.passwordFocus);
            },
            validator: controller.validateEmail,
          ),
          15.ph,

          /// Password Field
          _buildLabel(context, AppStringsAssets.passwordLabel),
          5.ph,
          Obx(
                () => CustomTextFieldWidget(
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.send,
              obscureText: !controller.isPasswordVisible.value,
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
              controller: controller.passwordController,
              focusNode: controller.passwordFocus,
              onFieldSubmitted: (_) => controller.handleLogin(),
              validator: controller.validatePassword,
            ),
          ),
        ],
      ),
    );
  }

  RichText _buildLabel(BuildContext context, String label) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
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
    );
  }
}
