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
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                width: 130,
                color: Colors.red,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                width: 130,
                color: Colors.green,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                width: 130,
                color: Colors.orange,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                width: 130,
                color: Colors.red,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                width: 130,
                color: Colors.green,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
