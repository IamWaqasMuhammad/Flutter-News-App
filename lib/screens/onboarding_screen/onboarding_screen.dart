import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("OnboardingScreen built");
    return Scaffold(
      appBar: AppBar(title: Text("Onboarding SCreen")),
      body: Center(child: Text("Welcome to OnboardingSCreen!")),
    );
  }
}
