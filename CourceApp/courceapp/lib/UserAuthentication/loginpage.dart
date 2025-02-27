import 'package:courceapp/UserAuthentication/signInPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var flagv = true;
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  // key login page
  GlobalKey<FormFieldState> usernamekey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passkey = GlobalKey<FormFieldState>();



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
              Image.asset("lib/Image/lock.jpg"),
              SizedBox(height: 30),
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: usernamekey,
                controller: username,
                validator: (value) {
                  if (value != null) {
                    return "Invalid Username";
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
                key: passkey,
                controller: pass,
                validator: (value) {
                  if (value != null) {
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
                  bool str1 = usernamekey.currentState!.validate();
                  bool str2 = passkey.currentState!.validate();
                  // logincheck();
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
                      child: Image.asset("lib/Image/google.png")),
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
                    child: Image.asset("lib/Image/twi.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("lib/Image/ins.jpg"),
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
