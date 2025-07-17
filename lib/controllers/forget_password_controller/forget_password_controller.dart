
import '../../constants/app_barrels/app_barrels.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  var isLoading = false.obs;


  @override
  void onClose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.onClose();
  }

  Future<void> sendResetEmail() async {
    final email = emailController.text.trim();

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        "Invalid Email",
        "Please enter a valid email address",
        backgroundColor: AppColors.error.withOpacity(0.5),
        colorText: Colors.white,
      );
      return;
    }

    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 2,
        )),
        barrierDismissible: false,
      );

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.back();
      Get.offNamed(AppRoutes.login);

      Get.snackbar(
        "Email Sent",
        "Check your SPAM folder for the reset link",
        backgroundColor: AppColors.success.withOpacity(0.5),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
      );
    } catch (e) {
      // ✅ Close loading dialog on error
      Get.back();

      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: AppColors.error.withOpacity(0.5),
        colorText: Colors.white,
      );
    }
  }

}
