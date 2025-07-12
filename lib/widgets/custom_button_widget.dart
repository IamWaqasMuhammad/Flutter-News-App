import 'package:flutter/material.dart';
import 'package:flutter_news_app/constants/app_colors/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final Color? pressedColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape boxShape;
  final double imgSize;
  final String imgUrl;
  final BoxFit? boxFit;
  final Gradient? gradient;
  final Key? buttonKey;
  final String buttonText;
  final void Function()? onPress;

  const CustomButtonWidget({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.pressedColor,
    this.borderRadius,
    this.boxShadow,
    this.boxShape = BoxShape.rectangle,
    this.imgSize = 1.0,
    this.imgUrl = '',
    this.boxFit,
    this.gradient,
    this.buttonKey,
    required this.buttonText,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // So splash works on gradients, images, etc.
      child: InkWell(
        key: buttonKey,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        onTap: onPress,
        splashColor: AppColors.darkInput,
        highlightColor: pressedColor?.withOpacity(0.4) ?? Colors.white10,
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            image: imgUrl.isNotEmpty
                ? DecorationImage(
              image: AssetImage(imgUrl),
              fit: boxFit,
              scale: imgSize,
            )
                : null,
            color: buttonColor,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            shape: boxShape,
            gradient: gradient,
          ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              color: AppColors.darkTitle
            )
          ),
        ),
      ),
    );
  }
}
