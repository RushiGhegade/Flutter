import 'dart:developer';
import 'dart:io';

import 'package:firebasepractice/controller.dart';
import 'package:firebasepractice/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowStudent extends StatefulWidget {
  const ShowStudent({super.key});

  @override
  State createState() {
    return _ShowStudentState();
  }
}

class _ShowStudentState extends State {
  StudentController studentController = Get.find();

  void changeCollage(String collage) {
    studentController.changeData(
      Student(
          name: studentController.student.value.name,
          collage: collage,
          cgpa: studentController.student.value.cgpa,
          file: studentController.student.value.file),
    );
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log("Build call");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Column(
                children: [
                  Image.file(File(studentController.student.value.file!.path)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    studentController.student.value.name,
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    studentController.student.value.collage,
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    studentController.student.value.cgpa,
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
            ElevatedButton(
              onPressed: () {
                changeCollage("Zeal Narhe");
              },
              child: Text('Change Collage'),
            )
          ],
        ),
      ),
    );
  }
}
