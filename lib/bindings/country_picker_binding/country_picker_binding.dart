import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';

class CountryPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryPickerController>(() => CountryPickerController());
  }

}