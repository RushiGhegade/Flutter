//Create a Screen and then add a floating action button. In this button, you
//will have to display your name and an Icon which must be placed in a row.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              const SizedBox(width: 100),
              (count >= 1) ? const Text("RushiKesh") : Container(),
              const SizedBox(width: 20),
              (count >= 2) ? const Icon(Icons.people) : Container(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            setState(() {});
            ;
          },
          child: const Text("Click"),
        ),
      ),
    );
  }
}
