import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
  // const MainApp();
  log("message");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
