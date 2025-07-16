import '../../../constants/app_barrels/app_barrels.dart';

class SignupTitleSection extends StatelessWidget {
  const SignupTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStringsAssets.signUpTitle,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: 52,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppStringsAssets.signUpSubTitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
