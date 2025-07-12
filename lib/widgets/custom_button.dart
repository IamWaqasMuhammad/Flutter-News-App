import '../constants/app_barrels/app_barrels.dart';
import '../controllers/button_controller/button_controller.dart';

class CustomButton extends StatelessWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final Color? pressedColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape boxShape;
  final double imgSize;
  final String imgUrl;
  final BoxFit? boxFit;
  final Gradient? gradient;
  final Key? buttonKey;
  final String buttonText;
  final void Function()? onPress;


  CustomButton({
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

    final ButtonController controller = Get.put(ButtonController());


    return Obx(() {
      return GestureDetector(
        key: buttonKey,
        onTapDown: (_) => controller.setPressed(true),
        onTapUp: (_) => controller.setPressed(false),
        onTapCancel: () => controller.setPressed(false),
        onTap: onPress,
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
            color: controller.isPressed.value
                ? (pressedColor ?? buttonColor?.withOpacity(0.7))
                : buttonColor,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            shape: boxShape,
            gradient: gradient,
          ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
