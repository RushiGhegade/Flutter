// Create a Screen in which We have a TextField in which the user
// will enter a password. The TextField must have rounded
// rectangular borders. At the end of the TextField give the icon
// which when pressed must make the text obscure and vice versa.

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  State createState() => _MyAppState();
}

bool flag = true;

class _MyAppState extends State {
  // const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: TextField(
              obscureText: (flag) ? true : false,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                suffixIcon: (flag)
                    ? GestureDetector(
                        onTap: () {
                          flag = !flag;
                          setState(() {});
                        },
                        child: const Icon(Icons.visibility_off))
                    : GestureDetector(
                        onTap: () {
                          flag = !flag;
                          setState(() {});
                        },
                        child: const Icon(Icons.visibility)),
                label: const Text("Password"),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
