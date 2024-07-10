import 'package:counterapp/Assignment2.dart';
// import 'package:counterapp/Assignment_1.dart';
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

class _MyAppState extends State {
  // const MainApp({super.key});
  int javaCount = 0;
  int flutterCount = 0;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment2(),
      // home: ,
    );
  }
}
