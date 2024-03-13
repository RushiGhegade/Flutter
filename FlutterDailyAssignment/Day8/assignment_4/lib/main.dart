// Display a ListView in the ListView display 10 Children such that each
// child must be a Container having a circular image in the beginning and
// next to the image display the Text. Give a border to the container.

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
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text("Name")
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
