import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen2.dart';
import 'package:musicapp/view/Screen3.dart';
import 'package:musicapp/view/bottomClass.dart';
import 'package:musicapp/view/main.dart';
import 'package:provider/provider.dart';

class FavoriteSong extends StatefulWidget {
  const FavoriteSong({super.key});

  @override
  State<FavoriteSong> createState() => _FavoriteSongState();
}

int countFav = 0;

class _FavoriteSongState extends State<FavoriteSong> {
  List<Map<String, dynamic>> fav = [];
  List<Map<String, dynamic>> favmost = [];

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   fav = Provider.of<Playlist>(context, listen: false).getdata;
    // });
    super.initState();
  }

  List<int> ind = [];

  void getdata() {
    favmost = Provider.of<Playlist>(context, listen: false).getdata;
    for (int i = 0; i < favmost.length; i++) {
      if (favmost[i]['islike'] == true) {
        countFav++;
        fav.add(favmost[i]);
        ind.add(i);
      }
    }

    print(fav);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    fav = [];
    ind = [];
    getdata();

    return Scaffold(
      bottomNavigationBar: const BottomClass(),
      backgroundColor: const Color.fromRGBO(32, 31, 31, 0.312),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Screen3();
                      },
                    ));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Favorite Song",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  height: 40,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: const Color.fromARGB(121, 255, 255, 255)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shuffle,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Suffle",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    indexs = ind[0];
                    log("${ind[index]}");
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Screen3();
                      },
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                          color: const Color.fromARGB(121, 255, 255, 255)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  // image: AssetImage("lib/Images/pk1.png"),
                  // fit: BoxFit.cover,
                  // opacity: 0.6),
                  ),
              child: ListView.builder(
                // padding: EdgeInsets.all(5),
                shrinkWrap: true,
                itemCount: fav.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      indexs = ind[index];
                      log("${ind[index]}");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Screen3();
                        },
                      ));
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 13, left: 15, right: 15),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 64,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          fav[index]['image'],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${fav[index]['sName']}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${fav[index]['Name']}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<Playlist>(context,
                                                    listen: false)
                                                .getdata[ind[index]]['islike'] =
                                            false;
                                        setState(() {});
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            height: 1,
                            color: const Color.fromARGB(32, 255, 255, 255),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
