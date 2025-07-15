import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../constants/app_barrels/app_barrels.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;
  final isLoading = false.obs;

  // Signup method
  void signupUser() async {
    final email = emailController.text.trim();
    final nameFromEmail = _extractNameFromEmail(email);

    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: passwordController.text.trim(),
        );

        // Set display name
        await userCredential.user?.updateDisplayName(nameFromEmail);

        isLoading.value = false;
        Get.snackbar(
          'Account Registered Successfully!',
          'Welcome, $nameFromEmail',
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );
        Get.offNamed(AppRoutes.login);
      } catch (error) {
        isLoading.value = false;
        Get.snackbar(
          'Account Registration Failed!',
          error.toString(),
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    }
  }

  // Extract name from email (part before @)
  String _extractNameFromEmail(String email) {
    try {
      String name = email.split('@').first;
      // Capitalize first letter
      return name[0].toUpperCase() + name.substring(1);
    } catch (e) {
      return 'User'; // Default name if extraction fails
    }
  }

  void loginWithGoogle() async {
    try {
      // Show loading dialog
      Get.dialog(
        const Center(child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 2,
        )),
        barrierDismissible: false,
      );

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        Get.back(); // close loading
        Get.snackbar(
          'Login Cancelled',
          'Google sign-in was cancelled by the user.',
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white,
        );
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Get.back(); // close loading

      Get.snackbar(
        'Login Successful',
        'Login with ${googleUser.email}!',
        backgroundColor: Colors.green.withOpacity(0.5),
        colorText: Colors.white,
      );
      Get.offNamed(AppRoutes.main);

    } catch (e) {
      Get.back(); // close loading if open

      Get.snackbar(
        'Login Failed',
        e.toString(),
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
    } else if (value.trim().length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!passwordRegex.hasMatch(value.trim())) {
      return 'Must include 1 uppercase, 1 digit, and 1 special character';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
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