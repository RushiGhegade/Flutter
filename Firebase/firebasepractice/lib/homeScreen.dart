import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasepractice/controller.dart';
import 'package:firebasepractice/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  State createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  XFile? xfile;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _collage = TextEditingController();
  final TextEditingController _cgpa = TextEditingController();

  void getImage() async {
    ImagePicker imagePicker = ImagePicker();

    xfile = await imagePicker.pickImage(source: ImageSource.gallery);

    log(xfile!.name);
    setState(() {});
  }

  void addData(Student student) {
    studentController.changeData(student);

    addFirebaseData(student);

    log("Data Added Locally");
    // Get.to(ShowStudent());
  }

  Future<String> addImageFirebase(XFile file) async {
    final ref = FirebaseStorage.instance.ref("Users").child(file.name);

    final addImage = await ref.putFile(File(file.path));

    String downloadUrl = await ref.getDownloadURL();

    return downloadUrl;
  }

  void addFirebaseData(Student student) async {
    try {
      String url = await addImageFirebase(xfile!);

      Map<String, dynamic> data = {
        "Name": student.name,
        "collage": student.collage,
        "cgpa": student.cgpa,
        "image": url,
      };

      final firebaseFirestore = FirebaseFirestore.instance.collection("Users");

      final addData = await firebaseFirestore.add(data);

      log("Student added Firebase");
    } catch (e) {
      log(e.toString());
    }
  }

  void clearControllers() {
    _name.clear();
    _cgpa.clear();
    _collage.clear();
    xfile = null;
    setState(() {});
  }

  StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                height: 210,
                width: 210,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: (xfile == null)
                    ? Icon(
                        Icons.person,
                        size: 80,
                      )
                    : Image.file(
                        File(xfile!.path),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _collage,
              decoration: InputDecoration(
                hintText: "Enter Collage",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _cgpa,
              decoration: InputDecoration(
                hintText: "Enter Cgpa",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 50),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                if (_name.text.isNotEmpty &&
                    _collage.text.isNotEmpty &&
                    _cgpa.text.isNotEmpty &&
                    xfile != null) {
                  addData(
                    Student(
                        name: _name.text,
                        collage: _collage.text,
                        cgpa: _cgpa.text,
                        file: xfile),
                  );
                }
                clearControllers();
              },
              child: Text(
                "Save Data",
                style: TextStyle(color: Colors.black, fontSize: 21),
              ),
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
