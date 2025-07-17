import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';
import 'package:flutter_news_app/controllers/forget_password_controller/forget_password_controller.dart';
import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';
import 'package:flutter_news_app/screens/forgot_password_screen/widgets/forget_sen_email_link_button_widget.dart';
import 'package:flutter_news_app/screens/forgot_password_screen/widgets/forget_text_field_widget.dart';
import 'package:flutter_news_app/screens/forgot_password_screen/widgets/forget_title_widget.dart';

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
              ForgetSenEmailLinkButtonWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
