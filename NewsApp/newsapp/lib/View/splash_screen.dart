import 'package:flutter/material.dart';
import 'package:newsapp/Authentication/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';

// import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        Duration(seconds: 2),
        () => {
              getlogindata(),
            });
  }

  void getlogindata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String email = sharedPreferences.getString('email') ?? "Not Login";
    String pass = sharedPreferences.getString('pass') ?? "Not Login";

    if (email != "Not Login" && pass != "Not Login") {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("lib/Images/Newsicon.jpg", width: 400),
      ),
    );
  }
}
