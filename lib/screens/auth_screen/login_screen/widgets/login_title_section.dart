


import '../../../../constants/app_barrels/app_barrels.dart';

class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.height,
        Text(
          AppStringsAssets.loginTitle,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 52,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkTitle
                : AppColors.titleActive,
            fontWeight: FontWeight.bold,
          ),
        ),
        15.height,
        Text(
          AppStringsAssets.loginTitle2,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 42,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        10.height,
        Text(
          AppStringsAssets.loginSubTitle,
          style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
