import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';
import 'package:flutter_news_app/screens/signup_screen/widgets/login_redirect_row.dart';
import 'package:flutter_news_app/screens/signup_screen/widgets/or_continue_with_google.dart';
import 'package:flutter_news_app/screens/signup_screen/widgets/signup_button.dart';
import 'package:flutter_news_app/screens/signup_screen/widgets/signup_form_section.dart';
import 'package:flutter_news_app/screens/signup_screen/widgets/signup_remember_and_forgot.dart';
import 'package:flutter_news_app/screens/signup_screen/widgets/signup_title_section.dart';
import 'package:get/get.dart';
import '../../constants/app_barrels/app_barrels.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.ph,
                const SignupTitleSection(),
                50.ph,
                SignupFormSection(controller),
                const SignupRememberMe(),
                40.ph,
                SignupButton(controller),
                10.ph,
                const OrContinueWithGoogle(),
                10.ph,
                const LoginRedirectRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
