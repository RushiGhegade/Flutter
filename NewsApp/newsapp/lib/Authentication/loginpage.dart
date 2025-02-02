import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/View/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signInPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var flagv = true;

  TextEditingController passtextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  // key login page
  GlobalKey<FormFieldState> emailkey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passkey = GlobalKey<FormFieldState>();

  void login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String email = sharedPreferences.getString('email') ?? "Not Login";
    String pass = sharedPreferences.getString('pass') ?? "Not Login";

    log("Yes i am reach here");

    if (email != "Not Login" && pass != "Not Login") {
      if (email == emailtextEditingController.text.toString() &&
          pass == passtextEditingController.text.toString()) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            content: Text("Login Successful")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text("Invalid Credential")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text("You Don't Have An Account Signup Please")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              Image.asset("lib/Images/lock.jpg"),
              SizedBox(height: 30),
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: emailkey,
                controller: emailtextEditingController,
                validator: (value) {
                  if (value != null && !value.contains('@gmail.com')) {
                    return "Invalid Email";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2),
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: passkey,
                controller: passtextEditingController,
                validator: (value) {
                  if (value != null && value.length < 6) {
                    return "Invalid Password";
                  } else {
                    return null;
                  }
                },
                obscureText: (flagv) ? true : false,
                obscuringCharacter: "*",
                // maxLines: 1,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: (flagv)
                        ? GestureDetector(
                            onTap: () {
                              flagv = !flagv;
                              setState(() {});
                            },
                            child: Icon(Icons.visibility_off))
                        : GestureDetector(
                            onTap: () {
                              flagv = !flagv;
                              setState(() {});
                            },
                            child: Icon(Icons.visibility)),
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(500, 50),
                    backgroundColor: Color.fromARGB(255, 32, 52, 230)),
                onPressed: () {
                  bool str1 = emailkey.currentState!.validate();
                  bool str2 = passkey.currentState!.validate();
                  if (str1 && str2) {
                    login();
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 1,
                width: 540,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Don't have an account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return SignInPage();
                      },
                    ));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 32, 52, 230)),
                  ),
                ),
              ),
              // Image.network(""),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset("lib/Images/google.png")),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUF3ReArthuTJeHcG-5AP_vAyEKzsH3JJNdg&s"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset("lib/Images/twi.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("lib/Images/ins.jpg"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
