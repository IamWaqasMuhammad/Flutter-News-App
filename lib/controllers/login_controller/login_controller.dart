import '../../constants/app_barrels/app_barrels.dart';

class LoginController extends GetxController {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Focus nodes
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  // Login method
  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter both fields',
          backgroundColor: AppColors.error,
          colorText: Colors.white);
      return;
    }

    // TODO: Add your actual authentication logic here
    Get.snackbar('Success', 'Logged in as $email',
        backgroundColor: AppColors.success,
        colorText: Colors.white);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
