import 'package:flutter/material.dart';
import 'package:flutter_news_app/extensions/sized_box_extension/sized_box_extension.dart';
import 'package:flutter_news_app/screens/splash%20_screen/widgets/splash_app_name_tagline_text_widget.dart';
import 'package:flutter_news_app/screens/splash%20_screen/widgets/splash_loading_widget.dart';
import 'package:flutter_news_app/screens/splash%20_screen/widgets/splash_logo_widget.dart';
import 'package:get/get.dart';

import '../../constants/app_barrels/app_barrels.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();

    return Scaffold(
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogoWidget(),
            20.ph,
            SplashAppNameTaglineTextWidget(),
            SplashLoadingWidget(controller: controller),
          ],
        )),
      ),
    );
  }
}
