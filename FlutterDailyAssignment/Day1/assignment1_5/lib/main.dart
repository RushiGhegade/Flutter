// Create a Screen, in the center of the Screen display a Container with
// rounded corners, give a specific color to the Container, the container
// must have a shadow of color red.

import 'package:flutter/material.dart';

void main() => runApp(const containerDemo());

class containerDemo extends StatelessWidget {
  const containerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ContainerDemo"),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red, offset: Offset(10, 10), blurRadius: 10)
                ]),
          ),
        ),
      ),
    );
  }
}
