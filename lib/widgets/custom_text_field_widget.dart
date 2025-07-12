import '../constants/app_barrels/app_barrels.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const CustomTextFieldWidget({
    super.key,
    this.textInputType,
    this.textInputAction,
    this.obscureText=false,
    this.validator,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16),
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        filled: Theme.of(context).brightness == Brightness.dark,
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkInput
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: Theme.of(context).brightness == Brightness.dark
              ? BorderSide.none
              : BorderSide(color: AppColors.bodyText),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: Theme.of(context).brightness == Brightness.dark
              ? BorderSide.none
              : BorderSide(color: AppColors.bodyText),
        ),
        suffixIcon: suffixIcon,

      ),
      validator: validator,
    );
  }
}
