import 'package:flutter_news_app/constants/app_icons/app_icons_assets.dart';
import 'package:flutter_news_app/controllers/login_controller/login_controller.dart';
import 'package:flutter_news_app/widgets/custom_button_widget.dart';
import 'package:flutter_news_app/widgets/custom_icon_button_widget.dart';
import 'package:flutter_news_app/widgets/custom_text_field_widget.dart';

import '../../constants/app_barrels/app_barrels.dart';
import '../signup_screen/singup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

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
                  'Hello',
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
                  'Again!',
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
                  'Welcome back you’ve\nbeen missed',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),

                /// EMAIL FIELD
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Email',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontSize: 14, color: AppColors.placeholder),
                      ),
                      TextSpan(
                        text: '*',
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
                ),

                SizedBox(
                  height: 15,
                ),

                /// PASSWORD FIELD
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Password',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontSize: 14, color: AppColors.placeholder),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors.error),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomTextFieldWidget(
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.send,
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocus,
                  onFieldSubmitted: (_) => controller.handleLogin(),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: AppColors.primary,
                      checkColor: AppColors.darkTitle,
                    ),
                    Text(
                      'Remember Me',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(width: 18,),
                    CustomButtonWidget(buttonText: 'Forget the Password?', onPress: (){},buttonHeight: 20,textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primary
                    ),),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomButtonWidget(
                    buttonText: 'Login',
                    onPress: controller.handleLogin,
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
                    'or continue with',
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
                      buttonText: 'Google',
                      buttonColor: AppColors.button,
                      buttonWidth: 154,
                      buttonHeight: 48,
                      borderRadius: BorderRadius.circular(10),
                      onPress: () {},
                      imgUrl: AppIconsAssets.googleIcon,
                      imgWidth: 24,
                      imgHeight: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomIconButtonWidget(
                      buttonText: 'Facebook',
                      buttonColor: AppColors.button,
                      buttonWidth: 154,
                      buttonHeight: 48,
                      borderRadius: BorderRadius.circular(10),
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
                Row(
                  children: [
                    Text(
                      'Don\'t have an Account?',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 16),
                    ),
                    CustomButtonWidget(
                      buttonText: 'SignUp',
                      onPress: () {Get.off(SignupScreen());},
                      textStyle:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 14,
                              ),
                      buttonHeight: 25,
                      buttonWidth: 70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
