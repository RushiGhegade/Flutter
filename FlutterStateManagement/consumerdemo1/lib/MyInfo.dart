import 'package:consumerdemo1/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State createState() {
    return _MyInfoState();
  }
}

class _MyInfoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Shopping", style: TextStyle(fontSize: 20)),
          // consumer2 constructor call
          Consumer2<Mall, Shopping>(builder: (context, value, value2, child) {
            return Column(
              children: [
                Text(value.mallName),
                const SizedBox(height: 30),
                Text(value.mallLoc),
                const SizedBox(height: 30),
                Text(value2.product),
                const SizedBox(height: 30),
                Text("${value2.price}"),
              ],
            );
          }),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Provider.of<Shopping>(context, listen: false).changedata(
                    price: Provider.of<Shopping>(context, listen: false)
                        .price += 50000.00,
                    product: "LCD");
              },
              child: const Text("Add product"))
        ],
      ),
    ));
  }
}
