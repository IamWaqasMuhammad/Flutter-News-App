
import '../../../constants/app_barrels/app_barrels.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.height,
                const SignupTitleSection(),
                50.height,
                SignupFormSection(controller),
                const SignupRememberMe(),
                40.height,
                SignupButton(controller),
                10.height,
                const SignupOrContinueWithGoogle(),
                10.height,
                const LoginRedirectRow(),
              ],
            ),
          ),
        ).paddingHorizontal(18),
    );
  }
}
