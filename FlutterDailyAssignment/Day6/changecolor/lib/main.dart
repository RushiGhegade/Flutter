// Create a Screen in which we have 3 Containers with size:
// (height:100,width:200) placed vertically. Each container must have a
// black border. Initially, the Color of the Containers must be white. The
// container that is tapped must change its color to red and other containers
// must be white.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State {
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  flag1 = !flag1;
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: (flag1) ? Colors.red : Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  flag2 = !flag2;
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: (flag2) ? Colors.red : Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  flag3 = !flag3;
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: (flag3) ? Colors.red : Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
