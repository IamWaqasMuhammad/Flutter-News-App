import '../../constants/app_barrels/app_barrels.dart';

class SignupController extends GetxController {
  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observables
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;
  final isLoading = false.obs;
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Sign up with email and password
  Future<void> registerUser() async {
    if (!formKey.currentState!.validate()) {
      Get.snackbar(
        'Invalid Details',
        'Please enter valid information to sign up',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (isLoading.value) return;
    isLoading.value = true;

    _showLoadingDialog();

    try {
      // Create the user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.sendEmailVerification(); // ✅ Send verification email

        _closeDialog();
        Get.snackbar(
          'Verification Email Sent',
          'A verification link has been sent to $email. Please check SPAM folder.',
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          duration: Duration(seconds: 4),
        );

        Get.offNamed(AppRoutes.login);
      }
    } on FirebaseAuthException catch (e) {
      _closeDialog();

      String errorMessage = '';
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already in use. Please try logging in with another Account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        default:
          errorMessage = e.message ?? 'An unknown Firebase error occurred.';
      }

      Get.snackbar(
        'Signup Failed',
        errorMessage,
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

  // Sign up with Google
  Future<void> registerWithGoogle() async {
    if (isLoading.value) return;
    isLoading.value = true;

    _showLoadingDialog();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        _closeDialog();
        Get.snackbar(
          'Cancelled',
          'Google sign-in cancelled',
          backgroundColor: Colors.orange.withOpacity(0.8),
          colorText: Colors.white,
        );
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      _closeDialog();
      Get.snackbar(
        'Signed up with Google',
        'Welcome, ${googleUser.displayName ?? googleUser.email}',
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );

      Get.offNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      _closeDialog();
      Get.snackbar(
        'Google Signup Failed',
        e.message ?? 'Firebase error occurred',
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

  // Validation methods
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (value.length < 3) return 'Name must be at least 3 characters';
    return null;
  }

  String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email';
    return null;
  }

  String? validatePassword(String? value) {
    final passwordRegex =
    RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~_]).{6,}$');
    if (value == null || value.isEmpty) return 'Password is required';
    if (!passwordRegex.hasMatch(value)) {
      return 'Min 6 chars, 1 uppercase, 1 digit, 1 special char';
    }
    return null;
  }

  // Toggle visibility
  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;

  void toggleRememberMe(bool? value) => rememberMe.value = value ?? false;

  // Loading dialog
  void _showLoadingDialog() {
    Get.dialog(
      const Center(child: CircularProgressIndicator(color: AppColors.primary,strokeWidth: 2,)),
      barrierDismissible: false,
    );
  }

  void _closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
