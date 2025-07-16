import 'package:flutter_news_app/constants/app_barrels/app_barrels.dart';
import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final Color? pressedColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape boxShape;
  final Gradient? gradient;
  final String buttonText;
  final void Function()? onPress;
  final String imgUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit? boxFit;

  const CustomIconButtonWidget({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.pressedColor,
    this.borderRadius,
    this.boxShadow,
    this.boxShape = BoxShape.rectangle,
    this.gradient,
    required this.buttonText,
    required this.onPress,
    required this.imgUrl,
    this.boxFit,
    this.imgHeight,
    this.imgWidth,
  });

  @override
  Widget build(BuildContext context) {

    final BorderRadius effectiveRadius =
        borderRadius ?? BorderRadius.circular(8);

    return Material(
      color: Colors.transparent,
      borderRadius: effectiveRadius,
      child: InkWell(
        borderRadius: effectiveRadius,
        onTap: onPress,
        splashColor: pressedColor ?? AppColors.darkInput.withOpacity(0.4),
        highlightColor: pressedColor ?? AppColors.darkInput.withOpacity(0.2),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: effectiveRadius,
            boxShadow: boxShadow,
            shape: boxShape,
            gradient: gradient,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PNGImagesWidget(
                imageUrl: imgUrl,
                height: imgHeight,
                width: imgWidth,
              ),
              8.pw,
              Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14, color: AppColors.placeholder),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
