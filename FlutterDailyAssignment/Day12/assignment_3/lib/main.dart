// Create 2 TextFields and below the textfield give the submit button. When
// the user presses the submit button validate the TextFields. If the text
// fields are empty then display an error message.

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  State createState() {
    return _MyAppState();
  }
}

TextEditingController name = TextEditingController();
TextEditingController college = TextEditingController();

GlobalKey<FormFieldState> namekey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> collegekey = GlobalKey<FormFieldState>();

class _MyAppState extends State {
  // const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  key: namekey,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return "Enter Your Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: collegekey,
                  controller: college,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter Your college";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter College",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool str = namekey.currentState!.validate();
                      // print(str);
                      bool str1 = collegekey.currentState!.validate();
                      print("done");
                      setState(() {});
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
