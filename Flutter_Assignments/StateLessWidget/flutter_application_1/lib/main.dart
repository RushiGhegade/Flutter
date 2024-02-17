import 'package:flutter/material.dart';

// Statefull
import 'package:flutter/material.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
      appBar :AppBar(title: const Text("AppBar"),),
      body:Center(
        child: const Text("Core 2 web"),
      ),
      ),
    );
  }
}
