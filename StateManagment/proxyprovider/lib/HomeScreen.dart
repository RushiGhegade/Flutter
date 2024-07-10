import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/main.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<Login>(context).userName),
            const SizedBox(
              height: 20,
            ),
            Text(Provider.of<Login>(context).password),
            const SizedBox(
              height: 20,
            ),
            Text(Provider.of<Employee>(context).empName),
            const SizedBox(
              height: 20,
            ),
            Text("${Provider.of<Employee>(context).empId}"),
          ],
        ),
      ),
    );
  }
}
