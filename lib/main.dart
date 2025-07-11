


import 'constants/app_linkers/app_linkers.dart';
import 'my_app.dart';

void main() {
  runApp(const AppInitializer());
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return OrientationBuilder(
          builder: (_, orientation) {
            return Builder(
              builder: (context) {
                Responsive.init(context);
                return const MyApp();
              },
            );
          },
        );
      },
    );
  }
}
