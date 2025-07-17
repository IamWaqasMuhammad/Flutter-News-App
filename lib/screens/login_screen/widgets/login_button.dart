
import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(LoginController controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Column(
      children: [
        Center(
          child: CustomButtonWidget(
            buttonText: AppStringsAssets.loginButtonText,
            onPress: controller.handleLogin,
            buttonHeight: 50,
            buttonWidth: 350,
            buttonColor: AppColors.primary,
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 18, color: AppColors.disabledInput),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        10.ph,
      ],
    );
  }
}
