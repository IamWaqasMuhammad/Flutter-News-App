import 'package:flutter/material.dart';

class PNGImages extends StatelessWidget {
  final double? height, width;
  final String imageUrl;

  const PNGImages({
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
