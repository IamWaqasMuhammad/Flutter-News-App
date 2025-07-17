import '../../../constants/app_barrels/app_barrels.dart';

class SignupButton extends StatelessWidget {
  final SignupController controller;
  const SignupButton(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButtonWidget(
        buttonText: AppStringsAssets.loginButtonText,
        onPress: controller.registerUser,
        buttonHeight: 50,
        buttonWidth: 350,
        buttonColor: AppColors.primary,
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 18, color: AppColors.disabledInput),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
