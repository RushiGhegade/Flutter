import 'package:flutter/material.dart';
import 'package:inheritedstate_demo/main.dart';

class MyInfo extends StatefulWidget {
  MyInfo({super.key});

  @override
  State createState() {
    return _MyInfoState();
  }
}

class _MyInfoState extends State {
  @override
  Widget build(BuildContext context) {
    MyApp obj = MyApp.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${obj.id}"),
              const SizedBox(
                height: 20,
              ),
              Text("${obj.name}"),
              const SizedBox(
                height: 20,
              ),
              Text("${obj.username}"),
            ],
          ),
        ),
      ),
    );
  }
}
