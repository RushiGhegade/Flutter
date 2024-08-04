import 'dart:developer';

import 'package:dummyapp/Dailogs/snackBar.dart';
import 'package:dummyapp/Login/login_Screen.dart';
import 'package:dummyapp/apis/apis.dart';
// import 'package:dummyapp/login_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State {
  // final _firebaseAuth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final flag = false;

  void _signUpValidate() async {
    if (_emailController.text.isNotEmpty && _passController.text.isNotEmpty) {
      try {
        await Apis.firebaseauth
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passController.text.trim(),
        )
            .then((value) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ));
          SnackBars(context, "Account Create Successfully").showSnackBars();
        });
      } on FirebaseAuthException catch (e) {
        log("${e.code}");
        if (e.code == 'email-already-in-use') {
          SnackBars(context, "Email is Already Present try with another email")
              .showSnackBars();
        } else if (e.code == 'weak-password') {
          SnackBars(context, "The Password must be at leat 6 characters long")
              .showSnackBars();
        } else if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email Format is Invalid Enter the Valid Format"),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${e.code}"),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter the Email And Password To Create Account"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ));
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            // const SizedBox(
            //   height: 10,
            // ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Sign In Account",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: () {
                _signUpValidate();
                setState(() {});
              },
              child: (!flag)
                  ? const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )
                  : const CircularProgressIndicator(
                      // value: 1,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
