import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAcuPDBPelbT9pNPyiCjCKdpywZ9wnrCx4",
        appId: "1:1095033601401:android:68a909bff1f414aa1f43a8",
        messagingSenderId: "1095033601401", // ProjectNumber
        storageBucket: "fir-cb76d.firebasestorage.app",
        projectId: "fir-cb76d"),
  ); //Firebase.initializeApp()

  getFirebaseData();

  runApp(const MyApp());
}

void getFirebaseData() async {
  final ref = FirebaseFirestore.instance.collection("Users");

  final data = await ref.get();

  final result = data.docs;

  List<Map<String, dynamic>> listMap = [];

  for (int i = 0; i < result.length; i++) {
    listMap.add(result[i].data());
  }
  log("$listMap");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
