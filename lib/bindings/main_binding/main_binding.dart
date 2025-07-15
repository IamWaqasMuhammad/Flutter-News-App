

import '../../constants/app_barrels/app_barrels.dart';




class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}

