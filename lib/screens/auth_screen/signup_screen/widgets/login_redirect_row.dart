

import '../../../../constants/app_barrels/app_barrels.dart';

class LoginRedirectRow extends StatelessWidget {
  const LoginRedirectRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          Text(
            AppStringsAssets.alreadyHaveAnAccountText,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14),
          ),
          CustomButtonWidget(
            buttonText: AppStringsAssets.loginButtonText,
            onPress: () {
              Get.back();
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
