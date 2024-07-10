import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/ProductInfo.dart';
import 'package:providerexample/controllerclass/ProductController.dart';
import 'package:providerexample/controllerclass/watchlistController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ProductController();
          },
        ),
        ChangeNotifierProvider(create: (context) {
          return WatchListController();
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductInfo(),
      ),
    );

    // );
  }
}
