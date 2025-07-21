

import '../../../constants/app_barrels/app_barrels.dart';

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
             ForgetTitleWidget(),
              ForgetTextFieldWidget(controller: controller),
              // ✅ Submit Button
              ForgetSendEmailLinkButtonWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
