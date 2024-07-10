import 'package:flutter/material.dart';
import 'package:samecodewriteonce/showCource.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State createState() {
    return _AssignmentState();
  }
}

class _AssignmentState extends State {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showCource1(
            cource: "java",
          ),
          const SizedBox(height: 10),
          showCource1(
            cource: "Flutter",
          ),
        ],
      ),
    );
  }
}
