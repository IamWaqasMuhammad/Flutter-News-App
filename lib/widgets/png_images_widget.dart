import 'package:flutter/material.dart';

class PNGImagesWidget extends StatelessWidget {
  final double? height, width;
  final String imageUrl;

  const PNGImagesWidget({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center( // Important for IntroductionScreen layout
      child: SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
