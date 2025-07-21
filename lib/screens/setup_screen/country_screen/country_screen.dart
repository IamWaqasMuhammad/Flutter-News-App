


import '../../../constants/app_barrels/app_barrels.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CountryPickerController>();

    return Scaffold(
      body: Column(
        children: [
          60.height,
          Center(
            child: Text('Select your Country'),
          ),
          30.height,
          Container(
            height: 50,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                style: BorderStyle.solid
              )
            ),
            child: Obx(() {
              final selected = controller.selectedCountry.value;

              return InkWell(
                onTap: () => showCountryPickerDialog(context),
                borderRadius: BorderRadius.circular(10),
                splashColor: AppColors.darkInput.withOpacity(0.2),
                highlightColor: AppColors.darkInput.withOpacity(0.1),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      selected != null
                          ? '${selected.flagEmoji} ${selected.name}'
                          : 'Select Country',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ), // optional extension
              );
            }),

          )
        ],
      ).paddingHorizontal(18),
    );
  }
}
