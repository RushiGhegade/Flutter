// In the screen add a container of size( width 100, height: 100) . The container
// must have a border as displayed in the below image. Give color to the container
// and border as per your choice.

import 'package:flutter/material.dart';

void main() {
  runApp(const Demo());
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
            ),
            border: Border.all(
              width: 2,
            ),
          ),
        ),
      ),
    ));
  }
}
