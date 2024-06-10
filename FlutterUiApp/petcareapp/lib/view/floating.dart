import 'package:flutter/material.dart';

import 'shop.dart';

class Floating extends StatefulWidget {
  const Floating({super.key});

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        // materialTapTargetSize:,
        backgroundColor: const Color.fromRGBO(245, 146, 69, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Shop();
          }));
        },
        label: const Column(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
            ),
            Text("cart")
          ],
        ));
  }
}
