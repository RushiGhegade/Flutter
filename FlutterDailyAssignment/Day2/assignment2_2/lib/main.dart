// In the screen add a container of size( width 100, height: 100) that must only
// have a left border of width 5 and color as per your choice. Give padding to the
// container and display a text in the Container.

import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerDemo());
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Container Demo")),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.amber,
              border: Border(left: BorderSide(color: Colors.red, width: 5)),
            ),
            child: const Text("Container"),
          ),
        ),
      ),
    );
  }
}
