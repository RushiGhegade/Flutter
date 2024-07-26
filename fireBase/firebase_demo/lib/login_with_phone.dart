import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LogonWithPhone extends StatefulWidget {
  const LogonWithPhone({super.key});

  @override
  State<LogonWithPhone> createState() => _LogonWithPhoneState();
}

final firebase = FirebaseAuth.instance;

class _LogonWithPhoneState extends State<LogonWithPhone> {
  void _loginUser() async {
    log("Function Start");

    final res = await firebase
        .verifyPhoneNumber(
      phoneNumber: resetPassController.text,
      verificationCompleted: (context) {},
      verificationFailed: (error) {
        log("$error");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${error}")));
      },
      codeSent: (String verification, int? token) {
        log("2.1=>${verification}");
        log("2.2=>$token");
      },
      codeAutoRetrievalTimeout: (verificationId) {
        log("3=>$verificationId");
      },
    )
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Successfully")));
    }).onError((error, stackTrace) {
      log("$error");
    });

    log("Function Completed");
  }

  final resetPassController = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        const Text("Enter The Phone Number"),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: resetPassController,
            decoration: const InputDecoration(
              hintText: "+91 1234455",
              // contentPadding: EdgeInsets,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(120, 20),
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                //  Future.delayed(const Duration(seconds: 1), () {
                isloading = !isloading;
                setState(() {});

                // log(emailController.text);
                // log(passController.text);
                _loginUser();
                await Future.delayed(const Duration(seconds: 2), () {});
                // await Future.delayed(const Duration(seconds: 2), () {
                isloading = !isloading;
                setState(() {});

                resetPassController.clear();
                // passController.clear();
              },
              child: (!isloading)
                  ? const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    )
                  : const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
            ),
          ],
        ),
      ]),
    ));
  }
}
