import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Daily Flash 1"),
        ),
        body: Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue], stops: [0.1, 0.9]),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
