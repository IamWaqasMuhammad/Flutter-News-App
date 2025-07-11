import 'package:flutter/material.dart';

class PNGImages extends StatelessWidget {
  final double size;
  String imageUrl;
  PNGImages({super.key, this.size = 100,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: size,
      height: size,
    );
  }
}
