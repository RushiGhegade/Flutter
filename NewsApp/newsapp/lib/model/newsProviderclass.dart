import 'package:flutter/material.dart';
import 'package:newsapp/model/savedatamodelclass.dart';

class News extends ChangeNotifier {
  Map newsData;

  List<Map<String, SaveData>> saveData;

  News({required this.newsData, required this.saveData});

  void changeNewsData(Map newsData) {
    this.newsData = newsData;
    notifyListeners();
  }

  void changeUserData(List<Map<String, SaveData>> saveData) {
    this.saveData = saveData;
    notifyListeners();
  }
}
