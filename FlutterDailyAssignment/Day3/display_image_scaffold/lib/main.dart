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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://lh3.googleusercontent.com/proxy/_tGjjsaGuTd18P7WJ-WVLKkQo4I_Jfu3LCONBAnL3dJBNhgyqAPhpWMyzN2i0KZjbwf2vntWokUVnZ9QD1NgIFIzuO0di0rZpoRO3fQ3ewmjoIXM0ne9s6ClkjS_LatyAF-s7q_JX0baaAYiMpNg4I3pHrGa8h9_0aea9IM"),
          ),
        ),
        child: const Center(
            child: Text(
          "Core2web",
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.w800, color: Colors.orange),
        )),
      ),
    ));
  }
}
