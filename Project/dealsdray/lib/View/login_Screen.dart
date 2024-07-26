import 'dart:developer';

import 'package:dealsdray/main.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _firebaseauth = Firebase.initializeApp();
  // final _firebaseauth = FirebaseAuth.instance;
  final _phoneController = TextEditingController();
  int index = 0;
  bool flag = false;
  void phoneValidate(String phone) async {
    log("Function Call ");

    // flag = !flag;
    setState(() {});
    log("Function call Successfully");
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${_phoneController.toString()}",
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        log("$error");
      },
      codeSent: (verificationId, forceResendingToken) {
        log(verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        log(verificationId);
      },
    );
    log("Function Complete Successfully");

    // Uri url = Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/otp");

    // final response = await http.post(url, body: {
    //   "mobileNumber": phone,
    // });
    // log("${response.statusCode}");
    // if (response.statusCode == 200) {
    //   log("SucessFully Login");
    // } else {
    //   log("Login faild");
    // }
    // flag = !flag;
    setState(() {});
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
                  opacity: const AlwaysStoppedAnimation(0.6),
                  "lib/Images/i1.jpg",
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
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Phone', 'Email'],
                radiusStyle: true,
                onToggle: (index) {
                  this.index = index!;
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
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: "Phone",
              ),
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
                phoneValidate(_phoneController.toString());
                setState(() {});
              },
              child: (!flag)
                  ? const Text(
                      "SEND CODE",
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
          ],
        ),
      ),
    );
  }
}
