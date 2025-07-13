
import '../constants/app_barrels/app_barrels.dart';

class CustomButtonWidget extends StatelessWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final Color? pressedColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape boxShape;
  final Gradient? gradient;
  final String buttonText;
  final void Function()? onPress;

  const CustomButtonWidget({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.pressedColor,
    this.textStyle,
    this.borderRadius,
    this.boxShadow,
    this.boxShape = BoxShape.rectangle,
    this.gradient,
    required this.buttonText,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {

    final BorderRadius effectiveRadius =
        borderRadius ?? BorderRadius.circular(8);

    return Material(
      color: buttonColor ?? Colors.transparent,
      borderRadius: effectiveRadius,
      child: InkWell(
        onTap: onPress,
        borderRadius: effectiveRadius,
        splashColor: pressedColor ?? AppColors.darkInput.withOpacity(0.2),
        highlightColor: pressedColor ?? AppColors.darkInput.withOpacity(0.1),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            borderRadius: effectiveRadius,
            boxShadow: boxShadow,
            shape: boxShape,
            gradient: gradient,
          ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
