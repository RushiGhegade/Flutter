import 'package:courceapp/UserAuthentication/signInPage.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 4),
        () => {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  // return SignInPage();
                  // return LoginPage();
                  return HomeScreen();
                },
              ))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Image.asset(
          "lib/Image/logo1.jpg",
        ),
      ),
    );
  }
}
