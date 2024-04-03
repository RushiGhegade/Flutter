import 'package:flutter/material.dart';

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
          title: const Text("Daily Flash 3"),
        ),
        body: Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.orange],
                    stops: [0.5, 0.5],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ),
    );
  }
}
