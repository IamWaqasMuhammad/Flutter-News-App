
import '../../constants/app_barrels/app_barrels.dart';

class LoginController extends GetxController {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;
  final isLoading = false.obs;

  // Focus nodes
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  Future<void> handleLogin() async {
    if (!formKey.currentState!.validate()) {
      Get.snackbar(
        'Login Failed',
        'Please enter valid Email & Password',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (isLoading.value) return;
    isLoading.value = true;

    _showLoadingDialog();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        _closeDialog();

        await FirebaseAuth.instance.signOut();

        Get.snackbar(
          'Email Not Verified',
          'Please check SPAM folder & verify your email before logging in.',
          backgroundColor: Colors.orange.withOpacity(0.8),
          colorText: Colors.white,
        );

        return; // prevent navigation to main page
      }

      _closeDialog();
      Get.snackbar(
        'Login Successful',
        'Welcome back, ${user!.displayName ?? user.email}',
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );

      Get.offNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      _closeDialog();
      Get.snackbar(
        'Login Error',
        e.message ?? 'Something went wrong',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } catch (e) {
      _closeDialog();
      Get.snackbar(
        'Login Error',
        'Unexpected error: $e',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> loginWithGoogle() async {
    if (isLoading.value) return;
    isLoading.value = true;

    _showLoadingDialog();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        _closeDialog();
        Get.snackbar(
          'Cancelled',
          'Google sign-in was cancelled.',
          backgroundColor: Colors.orange.withOpacity(0.8),
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

      _closeDialog();
      Get.snackbar(
        'Login Successful',
        'Signed in with Google as ${googleUser.email}',
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );

      Get.offNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      _closeDialog();
      Get.snackbar(
        'Google Sign-in Failed',
        e.message ?? 'Something went wrong',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } catch (e) {
      _closeDialog();
      Get.snackbar(
        'Error',
        'Unexpected error: $e',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~_]).{8,}$');
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!passwordRegex.hasMatch(value)) {
      return 'Must include 1 uppercase, 1 digit, and 1 special character';
    }
    return null;
  }

  void togglePasswordVisibility() => isPasswordVisible.value = !isPasswordVisible.value;
  void toggleRememberMe(bool? value) => rememberMe.value = value ?? false;

  void _showLoadingDialog() {
    Get.dialog(
      const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      barrierDismissible: false,
    );
  }

  void _closeDialog() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
