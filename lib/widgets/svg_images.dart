
import '../constants/app_linkers/app_linkers.dart';

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
