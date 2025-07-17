import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';

class SignupRedirectRow extends StatelessWidget {
  const SignupRedirectRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Get.toNamed(AppRoutes.signup);
            },
            textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 14,
            ),
            buttonHeight: 25,
            buttonWidth: 70,
          ),
        ],
      ),
    );
  }
}
