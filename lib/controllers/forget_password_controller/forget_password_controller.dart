
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
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 2,
          ),
        ),
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
        duration: const Duration(seconds: 4),
      );
    } on FirebaseAuthException catch (e) {
      Get.back(); // Close the loading dialog

      String message = "Something went wrong.";
      if (e.code == 'user-not-found') {
        message = "No user found with this email.";
      } else if (e.code == 'invalid-email') {
        message = "The email address is invalid.";
      }

      Get.snackbar(
        "Error",
        message,
        backgroundColor: AppColors.error.withOpacity(0.5),
        colorText: Colors.white,
      );
    } catch (e) {
      Get.back(); // Close the loading dialog

      Get.snackbar(
        "Error",
        "Unexpected error occurred: ${e.toString()}",
        backgroundColor: AppColors.error.withOpacity(0.5),
        colorText: Colors.white,
      );
    }
  }

}
