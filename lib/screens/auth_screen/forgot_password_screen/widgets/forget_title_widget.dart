
import '../../../../constants/app_barrels/app_barrels.dart';
import '../../../../constants/app_colors/app_colors.dart';
import '../../../../constants/app_strings/app_strings_assets.dart';

class ForgetTitleWidget extends StatelessWidget {
  const ForgetTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        56.height,
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_outlined),color: AppColors.disabledInput,),
        ),

        20.height,

        Text(
          AppStringsAssets.forgetTitle,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 40,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        12.height,

        Text(
          AppStringsAssets.forgetSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        40.height,
      ],
    );
  }
}
