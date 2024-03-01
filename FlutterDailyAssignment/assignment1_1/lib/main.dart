// Create an AppBar, give an Icon at the start of the appbar, give a title
// in the middle, and at the end add an Icon.

import 'package:flutter/material.dart';

void main() {
  runApp(const myhomepage());
}

class myhomepage extends StatelessWidget {
  const myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.supervised_user_circle_sharp),
            centerTitle: true,
            title: const Text("Assignment 1"),
            actions: [Icon(Icons.heart_broken)],
          ),
        ));
  }
}
