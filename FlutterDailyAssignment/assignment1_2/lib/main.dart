// Create an AppBar give a color of your choice to the AppBar and then
// add an icon at the start of the AppBar and 3 icons at the end of the
// AppBar.

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
          leading: const Icon(Icons.supervised_user_circle),
          centerTitle: true,
          title: const Text("Assignment1_2"),
          actions: const [
            Icon(Icons.abc_outlined),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.access_alarms_outlined),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.access_time_filled_rounded),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
