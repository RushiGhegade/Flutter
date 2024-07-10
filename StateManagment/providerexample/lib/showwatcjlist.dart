import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/DisplayScreen.dart';
import 'package:providerexample/controllerclass/ProductController.dart';
import 'package:providerexample/controllerclass/watchlistController.dart';

class showwatchlist extends StatefulWidget {
  const showwatchlist({super.key});

  @override
  State createState() {
    return _showwatchlistState();
  }
}

class _showwatchlistState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Favorite"),
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DisplayScreen()),
                );
              },
              child: Icon(Icons.arrow_back_ios_new_outlined),
            )),
        body: ListView.builder(
          itemCount: Provider.of<WatchListController>(context).list.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              width: 320,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 7),
                  ]),
              child: Row(
                children: [
                  Image.network(Provider.of<WatchListController>(context)
                      .list[index]
                      .url),
                  Column(
                    children: [
                      Text(
                          "Name   :${Provider.of<WatchListController>(context).list[index].name}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Quantity :${Provider.of<WatchListController>(context).list[index].quantity}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Price   :${Provider.of<WatchListController>(context).list[index].price}"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (Provider.of<WatchListController>(context,
                                  listen: false)
                              .list[index]
                              .isFavrite ==
                          true) {
                        Provider.of<WatchListController>(context, listen: false)
                            .list
                            .removeAt(index);
                        Provider.of<ProductController>(context, listen: false)
                            .list[index]
                            .isFavrite = false;
                        print("done");
                      }
                      setState(() {});
                    },
                    child: Provider.of<WatchListController>(context)
                            .list[index]
                            .isFavrite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite,
                          ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
