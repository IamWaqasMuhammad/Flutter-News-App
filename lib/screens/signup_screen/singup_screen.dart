
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
                const SignupOrContinueWithGoogle(),
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
