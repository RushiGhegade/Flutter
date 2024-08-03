import 'dart:developer';

import 'package:dummyapp/Dailogs/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_Screen.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State createState() {
    return _ForgetPassScreenState();
  }
}

class _ForgetPassScreenState extends State {
  final _firebaseAuth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  // final _passController = TextEditingController();

  final flag = false;

  void _signUpValidate() async {
    if (_emailController.text.isNotEmpty) {
      try {
        _firebaseAuth
            .sendPasswordResetEmail(email: _emailController.text.trim())
            .then((value) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ));
          SnackBars(context, "Password Reset Email Send Successfully")
              .showSnackBars();
        });
      } on FirebaseAuthException catch (e) {
        log("${e.code}");
        SnackBars(context, e.code).showSnackBars();
      }
    } else {
      SnackBars(context, "Enter Email").showSnackBars();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
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
            const SizedBox(
              height: 10,
            ),

            const Center(
              child: Text(
                "Reset Password ",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
            // TextFormField(
            //   controller: _passController,
            //   decoration: const InputDecoration(
            //     hintText: "Password",
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            const SizedBox(
              height: 20,
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
                      "Send Reset Password Email",
                      style: TextStyle(
                        fontSize: 17,
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
