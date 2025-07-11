
import '../../constants/app_linkers/app_linkers.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("OnboardingScreen built");
    return Scaffold(
      appBar: AppBar(title: Text("Onboarding SCreen")),
      body: Center(child: Text("Welcome to OnboardingSCreen!")),
    );
  }
}
