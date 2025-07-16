

import 'package:flutter_news_app/controllers/forget_password_controller/forget_password_controller.dart';

import '../../constants/app_barrels/app_barrels.dart';




class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}

