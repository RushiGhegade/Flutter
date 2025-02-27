import 'dart:developer';

import 'package:courceapp/firebaseOperations/firebaseoperation.dart';
import 'package:courceapp/main.dart';
import 'package:courceapp/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyCource extends StatefulWidget {
  BuyCource({super.key, required this.name, required this.val});
  String? name;
  int? val;

  @override
  State<BuyCource> createState() => _BuyCourceState();
}

class _BuyCourceState extends State<BuyCource> {
  bool flag = true;
  void addCource(String name, int val) async {
    await FirebaseOperation.addUser(name, val).then((onValue) {
      LectureData(lectureData: [], selectCource: null).getdataFromFirebase();
      ;
      Future.delayed(
          Duration(seconds: 5),
          () => {
                Provider.of<LectureData>(context, listen: false).lectureData =
                    list,
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ))
              });
    });

    log("Cource Get Sucessfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                flag = false;
                setState(() {});
                addCource(widget.name!, widget.val!);
              },
              child: (flag)
                  ? Text("Buy Cource")
                  : SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }
}
