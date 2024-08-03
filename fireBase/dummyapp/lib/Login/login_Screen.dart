import 'dart:developer';
import 'dart:io';

// import 'package:dummyapp/HomeScreen.dart';
import 'package:dummyapp/Dailogs/snackBar.dart';
import 'package:dummyapp/apis/apis.dart';
// import 'package:dummyapp/forgetPass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../View/HomeScreen.dart';
import 'forgetPass.dart';
import 'signInScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _firebaseauth = Firebase.initializeApp();
  // final _firebaseauth = FirebaseAuth.instance;

  // final _flirebaseauth = FirebaseAuth.instance;
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  int index = 0;
  bool flag2 = false;
  bool flag1 = false;

  Widget enterLoginInfo() {
    if (index == 0) {
      return Column(
        children: [
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              hintText: "Phone",
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
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
        ],
      );
    }
  }

  Future<void> loginValidate() async {
    log("Function Call ");

    flag2 = !flag2;
    setState(() {});

    if (index == 0) {
      if (_phoneController.text.trim().isNotEmpty) {
        try {
          await Apis.firebaseauth
              .verifyPhoneNumber(
            phoneNumber: _phoneController.text.toString(),
            verificationCompleted: (phoneAuthCredential) {},
            verificationFailed: (error) {
              log("$error");
            },
            codeSent: (verificationId, forceResendingToken) {},
            codeAutoRetrievalTimeout: (verificationId) {},
          )
              .then((value) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login With Phone Number Successfully"),
              ),
            );
          });
        } on FirebaseAuthException catch (e) {
          log("${e.code}");
        }
      }
    } else {
      if (_emailController.text.isNotEmpty && _passController.text.isNotEmpty) {
        try {
          await Apis.firebaseauth
              .signInWithEmailAndPassword(
            email: _emailController.text.trim().toString(),
            password: _passController.text.trim().toString(),
          )
              .then((value) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login With Email is Successfully"),
              ),
            );
          });
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ));
        } on FirebaseAuthException catch (e) {
          log("${e.code}");
          if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Incorrect Password "),
              ),
            );
          } else if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid User Please Sign Up Account"),
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
            content: Text("Enter the Email And Password"),
          ),
        );
      }
    }

    await Future.delayed(const Duration(seconds: 2));
    log("Function Complete Successfully");
    flag2 = !flag2;
    setState(() {});
  }

  void loginWithGoogle() async {
    flag1 = !flag1;
    setState(() {});
    signInWithGoogle().then((value) async {
      if (value != null) {
        log("${value.user}");
        log("${value.additionalUserInfo}");

        if (await Apis.userExits()) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ));
        } else {
          await Apis.createUser().then((value) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ));
          });
        }

        SnackBars(context, "Sign in Completed").showSnackBars();
      }
    });
    flag1 = !flag1;
    setState(() {});
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup("google.com");
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log("signInWithGoogle :$e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          content: Text("Something Went Wrong Please Check Internet"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: Image.asset(
                  fit: BoxFit.cover,
                  // scale: 8,
                  opacity: const AlwaysStoppedAnimation(0.7),
                  "lib/images/p5.png",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ToggleSwitch(
                minHeight: 45,
                minWidth: 100.0,
                cornerRadius: 15.0,
                activeBgColors: [
                  [Colors.red[800]!],
                  [Colors.red[800]!]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: index,
                totalSwitches: 2,
                labels: ['Phone', 'Email'],
                radiusStyle: true,
                onToggle: (index) {
                  this.index = index!;
                  setState(() {});
                  print('switched to: $index');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Glad to see you!",
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const Text(
              "Please Provide Your Phone Number",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
            // const SizedBox(
            //   height: 70,
            // ),
            const Spacer(
              flex: 1,
            ),

            enterLoginInfo(),
            // const SizedBox(
            //   height: 1,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ForgetPassScreen();
                      },
                    ));
                  },
                  child: const Text("Forget Password"),
                )
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: () {
                loginValidate();
                setState(() {});
              },
              child: (!flag2)
                  ? const Text(
                      "Login",
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
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont Have An Account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignInScreen();
                        },
                      ));
                    },
                    child: const Text("Sign Up"))
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            const Text(
                "--------------------------------- or ----------------------------------"),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: () {
                loginWithGoogle();
                setState(() {});
              },
              child: (!flag1)
                  ? Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("lib/images/google.png")),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Login With Google",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(
                      // value: 1,
                      color: Colors.white,
                    ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
