import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/ProductInfo.dart';
import 'package:providerexample/controllerclass/ProductController.dart';
import 'package:providerexample/controllerclass/watchlistController.dart';
import 'package:providerexample/showwatcjlist.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State createState() {
    return _DisplayScreenState();
  }
}

class _DisplayScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Display Product"), actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const showwatchlist()),
            );
          },
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ]),
      body: Container(
        // padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(10),
        height: 320,
        child: GridView.builder(
            // padding: EdgeInsets.all(10),

            // stream: null,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20, crossAxisSpacing: 10, crossAxisCount: 2),
            itemCount: Provider.of<ProductController>(context).list.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 2)
                        ],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        image: DecorationImage(
                            image: NetworkImage(
                                Provider.of<ProductController>(context)
                                    .list[index]
                                    .url),
                            fit: BoxFit.fitHeight),
                      ),
                      // child: Image.network(
                      //   Provider.of<ProductController>(context).url,
                      //   height: 200,
                      //   width: 200,
                      // ),
                    ),
                    Container(
                      // margin: EdgeInsets.all(10),
                      // height: 200,
                      width: 180,
                      padding: const EdgeInsets.only(left: 7),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name : ${Provider.of<ProductController>(context).list[index].name}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                              "Price : ${Provider.of<ProductController>(context).list[index].price}"),
                          Row(
                            children: [
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<ProductController>(context,
                                          listen: false)
                                      .changeflag(index);

                                  if (Provider.of<ProductController>(context,
                                          listen: false)
                                      .list[index]
                                      .isFavrite) {
                                    Provider.of<WatchListController>(context,
                                            listen: false)
                                        .addlist(Provider.of<ProductController>(
                                                context,
                                                listen: false)
                                            .list[index]);
                                  }

                                  // if (Provider.of<productModel>(context,
                                  //         listen: false)
                                  //     .isFavrite) {
                                  //   print("true");
                                  // } else {
                                  //   print("false");
                                  // }

                                  // print(Provider.of<WatchListController>(context,
                                  //         listen: false)
                                  //     .list);
                                },
                                child: (Provider.of<ProductController>(context)
                                        .list[index]
                                        .isFavrite)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                      ),
                                // color: Colors.red,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<ProductController>(context,
                                          listen: false)
                                      .addQuantity(index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 2)
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "${Provider.of<ProductController>(context).list[index].quantity}"),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<ProductController>(context,
                                          listen: false)
                                      .removeQuantity(index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black, blurRadius: 2)
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          name.clear();
          url.clear();
          price.clear();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductInfo()),
          );
        },
        child: const Text("Add"),
      ),
    );
  }
}
