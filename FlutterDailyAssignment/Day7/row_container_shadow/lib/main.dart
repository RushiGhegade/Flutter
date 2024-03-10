// Create a Screen with two horizontally aligned containers at the center of the
// screen. Apply a shadow to each container set individual colors and give a border
// to the Containers only the bottom edges of the container must be rounded.

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.orange,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(10, 10),
                        blurRadius: 10)
                  ]),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(10, 10),
                        blurRadius: 10)
                  ]),
            ),
          ],
        )),
      ),
    );
  }
}
