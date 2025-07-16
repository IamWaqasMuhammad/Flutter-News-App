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
              await googleSignIn.signOut();
              Get.offNamed(AppRoutes.login);
           
              print('Error signing out');
              // Show a message to the user or handle the error appropriately

        }, child: Text('Logout')),
      ),
    );
  }
}
