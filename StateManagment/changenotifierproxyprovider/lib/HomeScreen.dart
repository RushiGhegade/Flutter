import 'dart:developer';

import 'package:changenotifierproxyprovider/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    log("in build method");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Provider.of<Employee>(context).empId}"),
            const SizedBox(
              height: 20,
            ),
            Text(Provider.of<Employee>(context).empName),
            const SizedBox(
              height: 20,
            ),
            Text(Provider.of<Employee>(context).userName), // also use Login
            const SizedBox(
              height: 20,
            ),
            Consumer<Login>(
              builder: (context, login, child) {
                // return Text(Provider.of<Employee>(context).password);
                return Text(login.password);
              },
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Login>(context, listen: false)
                    .changePassword("123456");
              },
              child: const Text("Change Password"),
            ),
          ],
        ),
      ),
    );
  }
}
