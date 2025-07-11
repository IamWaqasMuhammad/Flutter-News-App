// lib/widgets/app_icon.dart
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SVGImages extends StatelessWidget {
  final double size;
   String imageUrl;
  SVGImages({super.key, this.size = 100,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageUrl,
      width: size,
      height: size,
    );
  }
}
