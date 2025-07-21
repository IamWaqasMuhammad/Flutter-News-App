

import '../../../constants/app_barrels/app_barrels.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.height,
                const LoginTitleSection(),
                30.height,
                LoginFormSection(controller),
                const LoginRememberAndForgot(),
                30.height,
                LoginButton(controller),
                const LoginOrContinueWithGoogle(),
                10.height,
                const SignupRedirectRow(),
              ],
            ),
          ),
        ).paddingHorizontal(18),
    );
  }
}
