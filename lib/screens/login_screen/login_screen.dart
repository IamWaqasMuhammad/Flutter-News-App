import 'package:flutter_news_app/constants/app_icons/app_icons_assets.dart';
import 'package:flutter_news_app/widgets/custom_button_widget.dart';
import 'package:flutter_news_app/widgets/custom_text_field_widget.dart';

import '../../constants/app_barrels/app_barrels.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  height: 50,
                ),

                /// USERNAME FIELD
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Username',
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
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomButtonWidget(
                    buttonText: 'Login',
                    onPress: () {},
                    buttonHeight: 50,
                    buttonWidth: 350,
                    buttonColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text('or continue with',style: Theme.of(context).textTheme.labelLarge,),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
