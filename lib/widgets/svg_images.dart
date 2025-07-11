
import '../constants/app_linkers/app_linkers.dart';

class SVGImages extends StatelessWidget {
  final double height,width;
   String imageUrl;
   BoxFit boxFit;
  SVGImages({super.key, this.boxFit=BoxFit.contain, this.height = 100, this.width = 100,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageUrl,
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}
