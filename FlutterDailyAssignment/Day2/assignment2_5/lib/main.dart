import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State createState() => _MainAppDemoState();
}

class _MainAppDemoState extends State {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              flag = !flag;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            //color: (flag) ? Colors.red : Colors.blue,
            decoration: BoxDecoration(
              color: (flag) ? Colors.red : Colors.blue,
              border: Border.all(width: 2),
            ),
            child: (flag)
                ? const Text("Click Me")
                : const Text("Container Tapped"),
          ),
        ),
      ),
    ));
  }
}
