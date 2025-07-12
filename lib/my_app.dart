
import 'constants/app_barrels/app_barrels.dart';
import 'constants/app_theme/app_theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages().pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
