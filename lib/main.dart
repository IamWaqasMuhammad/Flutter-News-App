import 'package:flutter/material.dart';

import 'config/responsive.dart';
import 'my_app.dart'; // 👈 import your responsive class

void main() {
  runApp(const AppInitializer());
}

// This widget initializes the screen dimensions
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
                Responsive.init(context); // 👈 initialize screen size once
                return const MyApp();
              },
            );
          },
        );
      },
    );
  }
}
