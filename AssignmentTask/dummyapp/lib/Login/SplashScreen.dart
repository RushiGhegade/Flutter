// import 'package:dummyapp/HomeScreen.dart';
import 'package:dummyapp/apis/apis.dart';
import 'package:flutter/material.dart';

import '../View/HomeScreen.dart';
import 'login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future<void>.delayed(const Duration(seconds: 8), () {
      if (Apis.firebaseauth.currentUser != null) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/images/p5.png"),
            // Text("Login"),
          ],
        ),
      ),
    );
  }
}
