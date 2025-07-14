import '../../constants/app_barrels/app_barrels.dart';

class SignupController extends GetxController {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Focus nodes
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;



  // Signup method
  void handleSignup() {
    final email = emailController.text.trim();

    if (formKey.currentState!.validate()) {
      // TODO: Add your actual authentication logic here
      Get.snackbar(
        'Account Register Successfully!',
        'You Register as $email',
        backgroundColor: Colors.green.withOpacity(0.5),
        colorText: Colors.white,
      );
      Get.offNamed(AppRoutes.login);
    } else {
      Get.snackbar(
        'Account Register Failed!',
        'Please enter valid Email & Password',
        backgroundColor: Colors.red.withOpacity(0.5),
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
    } else if (value.trim().length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!passwordRegex.hasMatch(value.trim())) {
      return 'Include 1 uppercase, 1 digit, and 1 special character';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }


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
