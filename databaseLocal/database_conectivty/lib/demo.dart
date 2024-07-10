import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic database;

class EmployeeClass {
  int empid;
  String name;
  double empsal;

  EmployeeClass(
      {required this.empid, required this.name, required this.empsal});

  Map<String, dynamic> empMap() {
    return {
      'empid': empid,
      'empname': name,
      'empsal': empsal,
    };
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(join(await getDatabasesPath(), "Employee.db"),
      version: 1, onCreate: (db, version) {
    db.execute('''  CREATE  TABLE Employee(
        empid INT PRIMARY KEY,
        empname Text,
        empsal REAL
      )''');
  });

  EmployeeClass obj1 = EmployeeClass(empid: 1, name: 'Rushi', empsal: 1.8);
  EmployeeClass obj2 = EmployeeClass(empid: 2, name: 'Ashish', empsal: 2.5);

  await insertinfo(obj1);
  await insertinfo(obj2);

  List<Map<String, dynamic>> info = await getinfo();
  print("-/-/-/-/-/-/-/-/-/-/-/-///-/");
  for (int i = 0; i < info.length; i++) {
    print(info[i]);
  }
  // print("-/-/-/-/-/-/-/-/-/-/-/-///-/");
  await remove(obj1);
  print("-/-/-/-/-/-/-/-/-/-/-/-///-/");
  info = await getinfo();

  for (int i = 0; i < info.length; i++) {
    print("${info[i]}");
  }

  await update(obj2);

  obj2 = EmployeeClass(empid: 4, name: "kanha", empsal: 2.4);

  await insertinfo(obj2);
  info = await getinfo();

  for (int i = 0; i < info.length; i++) {
    print("${info[i]}");
  }
}

Future<void> update(EmployeeClass obj) async {
  dynamic localdb = database;

  localdb.update(
    'Employee',
    obj.empMap(),
    where: "empid = ?",
    whereArgs: [obj.empid],
  );
}

Future<void> remove(EmployeeClass obj) async {
  dynamic localdb = await database;

  await localdb.delete(
    "Employee",
    where: "empid = ?",
    whereArgs: [obj.empid],
  );
}

Future<void> insertinfo(EmployeeClass obj) async {
  dynamic localdb = await database;

  localdb.insert(
    "Employee",
    obj.empMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getinfo() async {
  dynamic localdb = await database;

  List<Map<String, dynamic>> list = await localdb.query("Employee");

  return list;
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text("hello"),
//         ),
//       ),
//     );
//   }
// }
