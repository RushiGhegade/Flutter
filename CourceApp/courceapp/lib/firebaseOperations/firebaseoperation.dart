import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../ModelClasses/corcedatamodelclass.dart';

class FirebaseOperation {
  static final _firebaseDatabase = FirebaseDatabase.instance.ref('Cources');

  static final _firebaseAuth = FirebaseAuth.instance;

  // User SignIn With Email
  static Future<UserCredential> signInWithEmail(
      String email, String password) async {
    final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return res;
  }

  static Future<List<CourceDataModel>> getData() async {
    log("Start call");
    final data = await _firebaseDatabase.get();
    final dataval = data.value;
    List<CourceDataModel> list = [];
    if (data.exists && dataval is Map) {
      // log("${dataval['Backend Cources'][1]['courseEnrol']}");
      List<String> cource = [
        'Backend Cources',
        'Frontend Cources',
        'Language Cources'
      ];
      
      for (int j = 0; j < cource.length; j++) {
        for (int i = 0; i < dataval[cource[j]].length; i++) {
          list.add(CourceDataModel(
            courceId: dataval[cource[j]][i]['courseId'] as int? ?? 0,
            courceName: dataval[cource[j]][i]['courseName'] as String? ??
                'Unknown Course',
            image: dataval[cource[j]][i]['image'] as String? ?? '',
            courceEnrol: (dataval[cource[j]][i]['courseEnrol'] is List<dynamic>)
                ? List<String>.from(dataval[cource[j]][i]['courseEnrol'])
                : <String>[],
            courceLecture:
                (dataval[cource[j]][i]['courseLecture'] is List<dynamic>)
                    ? List<String>.from(dataval[cource[j]][i]['courseLecture'])
                    : <String>[],
            courcePDF: (dataval[cource[j]][i]['coursePDF'] is List<dynamic>)
                ? List<String>.from(dataval[cource[j]][i]['coursePDF'])
                : <String>[],
            courcePurchesBy: (dataval[cource[j]][i]['courcePurchesBy']
                    is List<dynamic>)
                ? List<String>.from(dataval[cource[j]][i]['courcePurchesBy'])
                : <String>[],
          ));
        }
      }
    }
    // log("Start call-");
    log("--------------------${list}");
    return list;
  }

  static Future<void> addUser(String name, int val) async {
    // int val = 0;
    // String name = "Backend Cources";
    log("Cource Name : $name");
    log("Cource index : $val");

    DatabaseReference courseRef =
        _firebaseDatabase.child("$name/$val/courcePurchesBy");

    DataSnapshot snapshot = await courseRef.get();

    log("${snapshot.value}");

    if (snapshot.exists) {
      List<dynamic> currentList = List<dynamic>.from(snapshot.value as List);

      // Add new value to the list
      if (!currentList.contains("My Cources")) {
        log("Add-----------");
        currentList.add("ghegaderushikesh065@gmail.com");
      } else {
        log("Not Add--------");
      }

      // Update the list in Firebase
      await courseRef.set(currentList);
      print("Updated successfully!");
    } else {
      print("List does not exist, creating a new one...");

      // If the list doesn't exist, create a new one
    }
  }
}
