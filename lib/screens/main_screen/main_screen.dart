
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
        child: Text('Main Screen'),
      ),
    );
  }
}
