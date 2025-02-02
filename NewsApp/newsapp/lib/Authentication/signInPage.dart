import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/Authentication/local_store.dart';

import 'loginpage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController moNo = TextEditingController();

  GlobalKey<FormFieldState> usernamekeys = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passkeys = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> emailkey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> moNoKey = GlobalKey<FormFieldState>();

  var flagv = true;

  void createAccount(String email, String pass) async {
    log("Message");
    bool login = await LocalStoreDB.storeData(email, pass);

    if (login) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text("Sign Up Sucessfully")));
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text("Please Try Again")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // SizedBox()
              // Image.asset("lib/image/lock.jpg"),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Create New Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // maxLines: 1,
                key: usernamekeys,
                controller: username,

                validator: (value) {
                  if (value != null && !value.startsWith(RegExp(r'[A-Z]'))) {
                    return "First latter must uppercase";
                  } else {
                    return null;
                  }
                },

                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2),
                    hintText: "Enter UserName",
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // maxLines: 1,
                key: emailkey,
                controller: email,

                validator: (value) {
                  if (value != null && !value.contains(RegExp(r'@gmail.com'))) {
                    return "email must have @gmail.com";
                  } else {
                    return null;
                  }
                },

                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // maxLines: 1,
                key: moNoKey,
                controller: moNo,

                validator: (value) {
                  if (value != null && value.length != 10) {
                    return "Enter the Mobile No 10 Digit";
                  } else {
                    return null;
                  }
                },

                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Enter Mobile No",
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: passkeys,
                controller: pass,
                validator: (value) {
                  if (value != null && value.length < 6) {
                    return "Password length should more than 6";
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
                  bool str1 = usernamekeys.currentState!.validate();
                  bool str2 = passkeys.currentState!.validate();
                  bool str3 = emailkey.currentState!.validate();
                  bool str4 = moNoKey.currentState!.validate();

                  if (str1 && str2 && str3 && str4) {
                    log("All clear");
                    log("${email.text.toString().trim()} ${pass.text.toString().trim()}");
                    createAccount(email.text.toString().trim(),
                        pass.text.toString().trim());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                        content: Text("Please fill All Field")));
                  }
                },
                child: Text(
                  "Sing Up",
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
                  "Already have an account?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 32, 52, 230)),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
