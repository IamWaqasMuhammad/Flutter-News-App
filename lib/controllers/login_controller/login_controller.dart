import '../../constants/app_barrels/app_barrels.dart';

class LoginController extends GetxController {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isPasswordVisible = false.obs;

  // Focus node
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  // Login method
  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Account Login Successful!',
        'You logged in as $email',
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );
      Get.toNamed(AppRoutes.main);
    } else {
      Get.snackbar(
        'Account Login Failed!',
        'Please enter valid Email & Password',
        backgroundColor:  Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  // Email validation
  String? validateEmail(String? value) {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~_]).{8,}$',
    );

    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    } else if (value.trim().length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!passwordRegex.hasMatch(value.trim())) {
      return 'Must include 1 uppercase, 1 digit, and 1 special character';
    }
    return null;
  }


  // Toggle method
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  final rememberMe = false.obs;

// Toggle method
  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
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
