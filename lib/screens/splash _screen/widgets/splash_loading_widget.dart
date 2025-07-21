
import '../../../constants/app_barrels/app_barrels.dart';
import '../../../constants/app_colors/app_colors.dart';
import '../../../controllers/splash_controller/splash_controller.dart';
class SplashLoadingWidget extends StatelessWidget {
  final SplashController controller;
  const SplashLoadingWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.isChecking.value
              ? const CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 2,
          )
              : null,
        ),
      ],
    ));
  }
}
