


import '../../constants/app_barrels/app_barrels.dart';

void showCountryPickerDialog(BuildContext context) {
  final controller = Get.find<CountryPickerController>();

  showCountryPicker(
    context: context,
    showPhoneCode: true,
    countryListTheme: CountryListThemeData(
      borderRadius: BorderRadius.circular(16),
      inputDecoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primary
          )
        ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.primary
              )
          )
      ),
    ),
    onSelect: (Country country) {
      controller.pickCountry(country);
    },
  );
}
