import 'package:flutter/material.dart';
import 'package:providerexample/modelclass/productModel.dart';

class WatchListController extends ChangeNotifier {
  List<productModel> list = [];

  void addlist(productModel obj) {
    list.add(obj);
    notifyListeners();
  }
}
