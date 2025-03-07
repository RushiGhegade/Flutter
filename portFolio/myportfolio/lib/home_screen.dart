import 'package:flutter/material.dart';
import 'package:myportfolio/mobilescreen.dart';
import 'package:myportfolio/navigationBar.dart';

import 'desktop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  MyNavigationBar(),
                  (constraints.maxWidth >= 620)
                      ? DeskTopScreen()
                      : MobileScreen(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
