
import 'package:flutter_news_app/controllers/login_controller/login_controller.dart';
import 'package:flutter_news_app/controllers/signup_controller/signup_controller.dart';

import '../constants/app_barrels/app_barrels.dart';




class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}

