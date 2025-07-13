

import '../../constants/app_barrels/app_barrels.dart';




class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}

