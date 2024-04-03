// Create a text field in which the user will enter the names of weekdays and
// when the user enters the weekday and presses enter the weekday must get
// added to the list and display the list below the text field.

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  State createState() {
    return _MainAppState();
  }
}

TextEditingController day = TextEditingController();

List Daylist = [];

class _MainAppState extends State {
  // const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                TextField(
                  onSubmitted: (value) {
                    Daylist.add(value);
                    day.clear();
                    setState(() {});
                  },
                  controller: day,
                  decoration: const InputDecoration(
                    label: Text("Enter Weekday"),
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
                Text("$Daylist")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
