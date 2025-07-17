import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';
import 'package:flutter_news_app/controllers/forget_password_controller/forget_password_controller.dart';
import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              56.ph,
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_outlined),color: AppColors.disabledInput,),
              ),

              20.ph,

              Text(
                AppStringsAssets.forgetTitle,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 40,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              12.ph,

               Text(
                AppStringsAssets.forgetSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              40.ph,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppStringsAssets.emailLabel,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                            color: AppColors.placeholder,
                          ),
                    ),
                    TextSpan(
                      text: AppStringsAssets.asterak,
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              ),
              5.ph,
              // ✅ Email Text Field
              CustomTextFieldWidget(
                controller: controller.emailController,
                focusNode: controller.emailFocusNode,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => controller.sendResetEmail(),
              ),

              40.ph,
              // ✅ Submit Button
              CustomButtonWidget(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
