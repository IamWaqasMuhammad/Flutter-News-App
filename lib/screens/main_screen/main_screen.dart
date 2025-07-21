
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
          
              final GoogleSignIn googleSignIn = GoogleSignIn();
              final prefs = await SharedPreferences.getInstance();
              await googleSignIn.signOut();
              await FirebaseAuth.instance.signOut();
              await prefs.setBool('isLoggedOut', true);
              Get.offAllNamed(AppRoutes.login);

        }, child: Text('Logout')),
      ),
    );
  }
}
