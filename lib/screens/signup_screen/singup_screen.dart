


import '../../constants/app_barrels/app_barrels.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  AppStringsAssets.signUpTitle,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 42,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppStringsAssets.signUpSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),

                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// EMAIL FIELD

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStringsAssets.emailLabel,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                fontSize: 14, color: AppColors.placeholder),
                          ),
                          TextSpan(
                            text: AppStringsAssets.asterak,
                            style: TextStyle(color: AppColors.error),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextFieldWidget(
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      controller: controller.emailController,
                      focusNode: controller.emailFocus,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(controller.passwordFocus);
                      },
                      validator: controller.validateEmail,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    /// PASSWORD FIELD
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStringsAssets.passwordLabel,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                fontSize: 14, color: AppColors.placeholder),
                          ),
                          TextSpan(
                            text: AppStringsAssets.asterak,
                            style: TextStyle(color: AppColors.error),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Obx(()=>CustomTextFieldWidget(
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.send,
                      obscureText: !controller.isPasswordVisible.value,
                      suffixIcon:  IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocus,
                      onFieldSubmitted: (_) => controller.handleSignup(),
                      validator: controller.validatePassword,
                    ),),
                  ],
                ),),
                Row(
                  children: [
                   Obx(()=> Checkbox(
                     value: controller.rememberMe.value,
                     onChanged: controller.toggleRememberMe,
                     activeColor: AppColors.primary,
                     checkColor: AppColors.darkTitle,
                   ),),
                    Text(
                      AppStringsAssets.rememberMeCheck,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: CustomButtonWidget(
                    buttonText: AppStringsAssets.signUpButtonText,
                    onPress: controller.handleSignup,
                    buttonHeight: 50,
                    buttonWidth: 350,
                    buttonColor: AppColors.primary,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        color: AppColors.disabledInput
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    AppStringsAssets.orContinueWithText,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButtonWidget(
                      buttonText: AppStringsAssets.googleButtonText,
                      buttonColor: AppColors.button,
                      buttonWidth: 154,
                      buttonHeight: 48,
                      borderRadius: BorderRadius.circular(8),
                      onPress: () {},
                      imgUrl: AppIconsAssets.googleIcon,
                      imgWidth: 24,
                      imgHeight: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomIconButtonWidget(
                      buttonText: AppStringsAssets.facebookButtonText,
                      buttonColor: AppColors.button,
                      buttonWidth: 154,
                      buttonHeight: 48,
                      borderRadius: BorderRadius.circular(8),
                      onPress: () {},
                      imgUrl: AppIconsAssets.facebookIcon,
                      imgWidth: 24,
                      imgHeight: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      Text(
                        AppStringsAssets.alreadyHaveAnAccountText,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 16),
                      ),
                      CustomButtonWidget(
                        buttonText: AppStringsAssets.loginButtonText,
                        onPress: () {
                          Get.offNamed(AppRoutes.login);
                        },
                        textStyle:
                        Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 14,
                        ),
                        buttonHeight: 25,
                        buttonWidth: 70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
