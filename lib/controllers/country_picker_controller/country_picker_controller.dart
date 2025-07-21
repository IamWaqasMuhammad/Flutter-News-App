

import '../../constants/app_barrels/app_barrels.dart';

class CountryPickerController extends GetxController {
  var selectedCountry = Rx<Country?>(null);

  void pickCountry(Country country) {
    selectedCountry.value = country;
  }
}
