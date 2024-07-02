import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen2.dart';
import 'package:musicapp/view/Screen3.dart';
import 'package:musicapp/view/main.dart';
import 'package:provider/provider.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Music",
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
                    border:
                        Border.all(color: Color.fromARGB(121, 255, 255, 255)),
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
                    indexs = 0;
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
                      border:
                          Border.all(color: Color.fromARGB(121, 255, 255, 255)),
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
                itemCount: Provider.of<Playlist>(context, listen: false)
                    .getdata
                    .length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      indexs = index;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Screen3();
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 13),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              height: 64,
                              width: 50,
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                      Provider.of<Playlist>(context)
                                          .getdata[index]['image'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            subtitle: Text(
                              "${Provider.of<Playlist>(context, listen: false).getdata[index]['Name']}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            title: Text(
                              "${Provider.of<Playlist>(context, listen: false).getdata[index]['sName']}",
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            height: 1,
                            color: const Color.fromARGB(32, 255, 255, 255),
                          )
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
