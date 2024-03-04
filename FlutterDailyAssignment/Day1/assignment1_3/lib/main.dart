// Create a Screen that will display an AppBar. Add a title in the AppBar
// the app bar must have a round rectangular border at the bottom.

import 'package:flutter/material.dart';

void main() {
  runApp(const appBarDemo());
}

class appBarDemo extends StatelessWidget {
  const appBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          centerTitle: true,
          title: const Text("Assignment1_3"),
        ),
      ),
    );
  }
}
