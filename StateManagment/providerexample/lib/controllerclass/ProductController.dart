import 'package:flutter/material.dart';
import 'package:providerexample/modelclass/productModel.dart';

class ProductController extends ChangeNotifier {
  // String url;
  // String name;
  // int price;
  // bool isFavrite = false;
  // int quantity = 0;
  // int addprice;

  // ProductController(this.name, this.url, this.price, this.isFavrite,
  //     this.quantity, this.addprice);

  List<productModel> list = [];

  void fillData(productModel obj) {
    list.add(obj);
  }

  void changeflag(int index) {
    list[index].isFavrite = !list[index].isFavrite;
    notifyListeners();
  }

  void addQuantity(int index) {
    // price += price;
    list[index].price += list[index].realprice;
    list[index].quantity++;
    notifyListeners();
  }

  void removeQuantity(int index) {
    list[index].price -= list[index].realprice;
    list[index].quantity--;
    notifyListeners();
  }
}
