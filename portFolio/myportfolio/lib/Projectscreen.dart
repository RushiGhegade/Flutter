import 'package:flutter/material.dart';
import 'package:myportfolio/showprojectscreen.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              myShowNavigationBar(context),
              SizedBox(
                height: 30,
              ),
              ShowProjects(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myShowNavigationBar(BuildContext context) {
  return Center(
    child: Text(
      "Projects",
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.047,
          fontWeight: FontWeight.bold,
          color: Colors.orange),
    ),
  );
}
