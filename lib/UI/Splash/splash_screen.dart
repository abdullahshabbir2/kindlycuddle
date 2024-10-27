import 'package:cuddle_care/UI/Splash/home_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // whenever your initialization is completed, remove the splash screen:
    // FlutterNativeSplash.remove();


    Future.delayed(const Duration(seconds: 5), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen() )
      );
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
            Center(
              child: Text('Splash'),
            )
        ],
      ),
    );
  }
}
