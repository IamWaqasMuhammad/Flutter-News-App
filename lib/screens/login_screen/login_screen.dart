import '../../constants/app_barrels/app_barrels.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  AppStringsAssets.loginTitle,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 52,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTitle
                            : AppColors.titleActive,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  AppStringsAssets.loginTitle2,
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
                  AppStringsAssets.loginSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
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
                                      fontSize: 14,
                                      color: AppColors.placeholder),
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
                        textInputType: TextInputType.emailAddress,
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
                                      fontSize: 14,
                                      color: AppColors.placeholder),
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
                          onFieldSubmitted: (_) => controller.loginUser(),
                          validator: controller.validatePassword,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
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
                    SizedBox(
                      width: 18,
                    ),
                    CustomButtonWidget(
                      buttonText: AppStringsAssets.forgetButtonText,
                      onPress: () {},
                      buttonHeight: 20,
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppColors.primary,
                              ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Obx(()=>CustomButtonWidget(
                    buttonText: AppStringsAssets.loginButtonText,
                    onPress: controller.loginUser,
                    buttonHeight: 50,
                    buttonWidth: 350,
                    loading: controller.isLoading.value,
                    buttonColor: AppColors.primary,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, color: AppColors.disabledInput),
                    borderRadius: BorderRadius.circular(10),
                  ),),
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
                    Center(
                      child: Obx(()=>CustomIconButtonWidget(
                        buttonText: AppStringsAssets.googleButtonText,
                        buttonColor: AppColors.button,
                        buttonHeight: 50,
                        buttonWidth: 350,
                        loading: controller.isLoading.value,
                        borderRadius: BorderRadius.circular(8),
                        onPress: controller.loginWithGoogle,
                        imgUrl: AppIconsAssets.googleIcon,
                        imgWidth: 30,
                        imgHeight: 30,
                      ),),
                    ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Text(
                        AppStringsAssets.dontHaveAnAccountText,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 16),
                      ),
                      CustomButtonWidget(
                        buttonText: AppStringsAssets.signUpButtonText,
                        onPress: () {
                          Get.offNamed(AppRoutes.signup);
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
