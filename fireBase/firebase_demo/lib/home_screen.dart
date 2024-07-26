import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/login_with_phone.dart';
import 'package:flutter/material.dart';

import 'WelcomeScreen.dart';

final firebase = FirebaseAuth.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void loginUser() async {
    final user = firebase.currentUser;
    log("$user");
    if (true) {
      if (emailController.text.trim().isNotEmpty &&
          passController.text.trim().isNotEmpty) {
        try {
          final userCredential = await firebase.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim(),
          );
          log("$userCredential");
          log("login sucessfully");
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const WelcomeScreen();
            },
          ));
        } on FirebaseAuthException catch (error) {
          log("ErrorMessage :${error.toString()}");
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.pink,
              content: Text("${error.message} Authentication Faild"),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid Email and password"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  void resetPassword() async {
    if (emailController.text.isNotEmpty) {
      try {
        final userCredentioal =
            await firebase.sendPasswordResetEmail(email: emailController.text);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("password Reset Email send Successfully")));
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$error")));
      }
      emailController.clear();
      passController.clear();
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter the Email")));
    }
  }

  void signIn() async {
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      try {
        final userCredential = await firebase.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );
        log("$userCredential");
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account Create Successfully")));
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$error")));
      }
      emailController.clear();
      passController.clear();
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Enter the Email And Password")));
    }
  }

  bool islogin = false;
  bool isloading = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 193, 7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            // height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Enter The Email"),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Enter The Password"),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    // cursorHeight: 1,
                    controller: passController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        resetPassword();
                        setState(() {});
                      },
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                          color: Color.fromARGB(255, 21, 24, 198),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                        log(emailController.text);
                        log(passController.text);
                        loginUser();
                        await Future.delayed(const Duration(seconds: 1), () {});
                        // await Future.delayed(const Duration(seconds: 2), () {
                        isloading = !isloading;
                        setState(() {});

                        emailController.clear();
                        passController.clear();
                      },
                      child: (!isloading)
                          ? Text(
                              (!islogin) ? "Login" : "Sign in",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          : const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(160, 20),
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const LogonWithPhone();
                            },
                          ));
                        },
                        child: const Text(
                          "Login With Phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account then "),
                    TextButton(
                      onPressed: () {
                        signIn();
                        setState(() {});
                      },
                      child: const Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
