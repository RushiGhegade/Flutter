import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxyprovider/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class Login {
  String userName;
  String password;

  Login({required this.userName, required this.password});
}

class Employee {
  String empName;
  int empId;
  String userName;
  String password;

  Employee(
      {required this.empId,
      required this.empName,
      required this.userName,
      required this.password});
}

class Demo {
  int x;
  Demo(this.x);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) {
          log("In Provder Craete");
          return Login(userName: "Rushi@123", password: "Rushi#12");
        }),
        ProxyProvider<Login, Employee>(
          create: (context) {
            log("In Create");
            // return Demo(10);
            return Employee(
                empId: 1,
                empName: "Rushikesh",
                userName: Provider.of<Login>(context,listen: false).userName,
                password: Provider.of<Login>(context, listen: false).password);
          },
          update: (context, login, employee) {
            log("In update");
            // return De;
            return Employee(
                empId: 1,
                empName: "Rushikesh",
                userName: login.userName,
                password: Provider.of<Login>(
                  context,
                ).password);
          },
        )
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
