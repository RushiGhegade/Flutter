class productModel {
  String url;
  String name;
  int price;
  bool isFavrite = false;
  int quantity = 0;
  int realprice = 0;

  productModel(this.isFavrite, this.quantity,this.realprice,
      {required this.url, required this.name, required this.price});
}
