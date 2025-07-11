import 'package:flutter_news_app/widgets/svg_images.dart';

import '../../../constants/app_linkers/app_linkers.dart';

class OnboardContent extends StatelessWidget {
  final String title, subtitle, image;

  const OnboardContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SVGImages(
          imageUrl: image,
          height:584,
          width: 428,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
