import 'package:flutter/material.dart';
import 'package:inheritedstate_demo/showinfo.dart';

class Assignment extends StatefulWidget {
  Assignment({super.key});

  @override
  State createState() {
    return _AssignmentState();
  }
}





class _AssignmentState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowInfo(),
    );
  }
}
