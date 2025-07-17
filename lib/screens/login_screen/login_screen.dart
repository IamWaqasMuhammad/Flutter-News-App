
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
                const LoginOrContinueWithGoogle(),
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
