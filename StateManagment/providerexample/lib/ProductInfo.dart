import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/DisplayScreen.dart';
import 'package:providerexample/controllerclass/ProductController.dart';
import 'package:providerexample/modelclass/productModel.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State createState() {
    return _ProductInfoState();
  }
}

TextEditingController name = TextEditingController();
TextEditingController url = TextEditingController();
TextEditingController price = TextEditingController();

class _ProductInfoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Image Url"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: url,
              decoration: const InputDecoration(
                  hintText: "image Url",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Product Name"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                  hintText: "Product Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Product Price"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: price,
              decoration: const InputDecoration(
                  hintText: "Product Price",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      productModel obj = productModel(false, 1,int.parse(price.text),
                          url: url.text,
                          name: name.text,
                          price: int.parse(price.text));

                      Provider.of<ProductController>(context, listen: false)
                          .fillData(obj);

                      print(
                          Provider.of<ProductController>(context, listen: false)
                              .list);

                      url.clear();
                      name.clear();
                      price.clear();

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const DisplayScreen()),
                      // );
                    },
                    child: const Text("Add Data")),
                ElevatedButton(
                    onPressed: () {
                      // productModel obj = productModel(false, 1,
                      //     url: url.text,
                      //     name: name.text,
                      //     price: int.parse(price.text));

                      // Provider.of<ProductController>(context, listen: false)
                      //     .fillData;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DisplayScreen()),
                      );
                    },
                    child: const Text("Submit")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
