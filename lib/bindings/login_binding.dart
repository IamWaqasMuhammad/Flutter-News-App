
import 'package:flutter_news_app/controllers/login_controller/login_controller.dart';

import '../constants/app_barrels/app_barrels.dart';




class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

