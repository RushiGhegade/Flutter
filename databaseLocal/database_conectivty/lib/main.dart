import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic database;

class PlayerClass {
  int jrno;
  String name;
  double avg;

  PlayerClass({required this.jrno, required this.name, required this.avg});

  Map<String, dynamic> playermap() {
    return {
      'jrno': jrno,
      'name': name,
      'avg': avg,
    };
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // open the database
  database = openDatabase(
    // set the path
    join(await getDatabasesPath(), "player.db"),
    // version give
    version: 1,
    onCreate: (db, version) => db.execute('''
      CREATE TABLE Player(jrno INTEGER PRIMARY KEY , name Text , avg REAL)
    '''),
  );

  PlayerClass obj1 = PlayerClass(jrno: 7, name: "MSD", avg: 60.10);
  PlayerClass obj2 = PlayerClass(jrno: 18, name: "virat", avg: 50.10);

  await insertData(obj1);
  await insertData(obj2);

  List<Map<String, dynamic>> info = await getPlayer();

  for (int i = 0; i < info.length; i++) {
    print(info[i]);
  }

  await deleteinfo(obj1);
  info = await getPlayer();
  print("After delete");
  for (int i = 0; i < info.length; i++) {
    print(info[i]);
  }

  print("After update");
  obj2 = PlayerClass(jrno: 18, name: "virat Khohli", avg: 50.10);

  updateinfo(obj2);

  info = await getPlayer();
  print("After delete");
  for (int i = 0; i < info.length; i++) {
    print(info[i]);
  }
}

// update the database

Future<void> updateinfo(PlayerClass obj) async {
  dynamic localdb = await database;

  await localdb.update(
    'Player',
    obj.playermap(),
    where: "jrno = ?",
    whereArgs: [obj.jrno],
  );
}

// delete the data from database
Future<void> deleteinfo(PlayerClass obj) async {
  dynamic localdb = await database;

  await localdb.delete(
    'Player',
    where: "jrno = ?",
    whereArgs: [obj.jrno],
  );
}

// retrive the data from database
Future<List<Map<String, dynamic>>> getPlayer() async {
  dynamic localdb = await database;

  List<Map<String, dynamic>> pinfo = await localdb.query('Player');

  return pinfo;
}

// insert the data into database
Future<void> insertData(PlayerClass obj) async {
  dynamic localdb = await database;

  await localdb.insert(
    'Player',
    obj.playermap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
