import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';

import '../../../constants/app_barrels/app_barrels.dart';

class OrContinueWithGoogle extends StatelessWidget {
  const OrContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Column(
      children: [
        Center(
          child: Text(
            AppStringsAssets.orContinueWithText,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        10.ph,
        Center(
          child: CustomIconButtonWidget(
            buttonText: AppStringsAssets.googleButtonText,
            buttonColor: AppColors.button,
            buttonHeight: 50,
            buttonWidth: 350,
            borderRadius: BorderRadius.circular(8),
            onPress: controller.loginWithGoogle,
            imgUrl: AppIconsAssets.googleIcon,
            imgWidth: 30,
            imgHeight: 30,
          ),
        ),
      ],
    );
  }
}