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
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(color: Colors.red, offset: Offset(5, 5))
                ],
                border: Border.all(width: 1),
                gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.green],
                    stops: [0.1, 0.4, 0.9])
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
          ),
        ),
      ),
    );
  }
}
