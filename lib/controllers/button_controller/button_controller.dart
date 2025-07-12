
import '../../constants/app_barrels/app_barrels.dart';

class ButtonController extends GetxController {
  var isPressed = false.obs;

  void setPressed(bool value) {
    isPressed.value = value;
  }
}
