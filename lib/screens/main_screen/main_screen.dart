
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/app_barrels/app_barrels.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('MainScreen'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () async {
          await FacebookAuth.instance.logOut();
          await GoogleSignIn().signOut();
          FirebaseAuth.instance.signOut();
          Get.offNamed(AppRoutes.login);
        }, child: Text('Logout')),
      ),
    );
  }
}
