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
          title: const Text("Daily Flash 4"),
        ),
        body: Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.red, offset: Offset(8, 8), blurRadius: 2)
              ],
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                stops: [0.1, 0.6],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
