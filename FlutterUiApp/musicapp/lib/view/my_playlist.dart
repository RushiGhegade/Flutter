import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/view/bottomClass.dart';

import "favoriteMusic.dart";

class MyPlaylist extends StatefulWidget {
  const MyPlaylist({super.key});

  @override
  State<MyPlaylist> createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  List<Map<String, dynamic>> list = [
    {
      "icon": Icons.favorite,
      "Name": "Favorite Song",
      "Count": countFav,
    },
    {
      "icon": Icons.circle,
      "Name": "Recently Play",
      "Count": 10,
    },
    {
      "icon": Icons.motion_photos_pause_outlined,
      "Name": "Most Play",
      "Count": 20,
    },
    // {
    //   "icon": Icons.music_note_rounded,
    //   "Name": "PlayList 1",
    //   "Count": 1,
    // },
  ];
  final TextEditingController _controller = TextEditingController();
  void addPlaylist() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 18,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Give your playlist a Name",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "My Playlist #1",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      list.add({
                        "icon": Icons.music_note_rounded,
                        "Name": _controller.text,
                        "Count": 0,
                      });
                      _controller.clear();
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      width: 140,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Color.fromARGB(255, 5, 246, 13),
                      ),
                      child: Text(
                        "Create",
                        style: GoogleFonts.poppins(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.clear();
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      width: 140,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: const Color.fromARGB(255, 255, 19, 3),
                      ),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  void showDailog(int index) {
    showDialog(
      // barrierColor: const Color.fromARGB(33, 255, 255, 255),
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Column(
              children: [
                Text(
                  "Do You Want to Delele ",
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                //${list[index]['Name']} playlist
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${list[index]['Name']}",
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      " playlist",
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            content: Container(
              height: 50,
              width: 270,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      list[index].remove("Name");
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: Text(
                        "NO",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 31, 31, 0.312),
      bottomNavigationBar: const BottomClass(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  "My PlayList",
                  style: GoogleFonts.sora(
                    fontSize: 31,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                IconButton(
                  focusColor: Colors.red,
                  color: Colors.white,
                  iconSize: 35,
                  onPressed: () {
                    addPlaylist();
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return (list[index]['Name'] != null)
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: (index < 3)
                                      ? const Color.fromARGB(83, 255, 19, 2)
                                      : const Color.fromARGB(
                                          200, 102, 101, 101),
                                ),
                                child: Icon(
                                  list[index]["icon"],
                                  size: 32,
                                  color: (index < 3)
                                      ? const Color.fromARGB(255, 255, 17, 0)
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index]['Name'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${list[index]['Count']}",
                                    style: GoogleFonts.sora(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                          127, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  showDailog(index);
                                },
                                child: const Icon(
                                  size: 26,
                                  // Icons.more_vert,
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            color: const Color.fromARGB(50, 255, 255, 255),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
