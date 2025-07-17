
import '../../../constants/app_barrels/app_barrels.dart';

class ForgetSenEmailLinkButtonWidget extends StatelessWidget {
  final ForgotPasswordController controller;
  const ForgetSenEmailLinkButtonWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      buttonText: AppStringsAssets.sendResetLinkButtonText,
      onPress: controller.sendResetEmail,
      buttonHeight: 50,
      buttonWidth: 350,
      buttonColor: AppColors.primary,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 18, color: AppColors.disabledInput),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
