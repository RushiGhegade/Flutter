import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multiproviderstate/main.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatefulWidget {
  @override
  State createState() {
    // log("start create state");
    return _NewScreenState();
  }
}

class _NewScreenState extends State {
  @override
  Widget build(BuildContext context) {
    log("in newScreen build");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<Employee>(context).empName),
            const SizedBox(
              height: 10,
            ),
            Text("${Provider.of<Employee>(context).empId}"),
            const SizedBox(
              height: 30,
            ),
            Text(Provider.of<Devloper>(context).projectName),
            const SizedBox(
              height: 20,
            ),
            Text("${Provider.of<Devloper>(context).salary}"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Devloper>(context, listen: false)
                      .changeData(projectName: "Web Devlopment", salary: 1000);
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
