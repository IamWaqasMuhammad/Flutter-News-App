import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';
import 'package:flutter_news_app/screens/login_screen/widgets/Login_remember_and_forgot.dart';
import 'package:flutter_news_app/screens/login_screen/widgets/login_button.dart';
import 'package:flutter_news_app/screens/login_screen/widgets/login_form_section.dart';
import 'package:flutter_news_app/screens/login_screen/widgets/login_title_section.dart';
import 'package:flutter_news_app/screens/login_screen/widgets/or_continue_with_google.dart';
import 'package:flutter_news_app/screens/login_screen/widgets/signup_redirect_row.dart';
import 'package:get/get.dart';
import '../../constants/app_barrels/app_barrels.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.ph,
                const LoginTitleSection(),
                30.ph,
                LoginFormSection(controller),
                const LoginRememberAndForgot(),
                30.ph,
                LoginButton(controller),
                const OrContinueWithGoogle(),
                10.ph,
                const SignupRedirectRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
