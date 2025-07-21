
import '../../../../constants/app_barrels/app_barrels.dart';

class SignupFormSection extends StatelessWidget {
  final SignupController controller;
  const SignupFormSection(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email Field
          _buildLabel(context, AppStringsAssets.emailLabel),
          const SizedBox(height: 5),
          CustomTextFieldWidget(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            controller: controller.emailController,
            focusNode: controller.emailFocus,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(controller.passwordFocus),
            validator: controller.validateEmail,
          ),

          const SizedBox(height: 15),

          /// Password Field
          _buildLabel(context, AppStringsAssets.passwordLabel),
          const SizedBox(height: 5),
          Obx(() => CustomTextFieldWidget(
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.send,
            obscureText: !controller.isPasswordVisible.value,
            suffixIcon: IconButton(
              icon: Icon(controller.isPasswordVisible.value
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              onPressed: controller.togglePasswordVisibility,
            ),
            controller: controller.passwordController,
            focusNode: controller.passwordFocus,
            onFieldSubmitted: (_) => controller.registerUser(),
            validator: controller.validatePassword,
          )),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String label) {
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
