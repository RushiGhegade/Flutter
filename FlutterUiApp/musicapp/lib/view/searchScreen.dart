import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen2.dart';
import 'package:musicapp/view/Screen3.dart';
import 'package:musicapp/view/bottomClass.dart';
import 'package:musicapp/view/main.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      orignal = Provider.of<Playlist>(context, listen: false).getdata;
      setState(() {});
    });
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> orignal = [];

  void searchResult(String str) {
    List<Map<String, dynamic>> result = [];

    if (str.isEmpty) {
      result = Provider.of<Playlist>(context, listen: false).getdata;
    } else {
      result = Provider.of<Playlist>(context, listen: false).getdata.where(
        (song) {
          if (song['sName'].toLowerCase().contains(str.toLowerCase())) {
            return true;
          } else {
            return false;
          }
        },
      ).toList();
    }
    setState(() {
      orignal = result;
    });
  }

  bool flag = false;
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 50,
              width: 390,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _controller,
                onChanged: (value) {
                  flag = true;
                  searchResult(value);
                },
                onFieldSubmitted: (value) {
                  flag = false;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(135, 255, 255, 255),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(20, 255, 255, 255),
                  hintText: "Search Song",
                  hintStyle: const TextStyle(
                    height: 4.6,
                    color: Color.fromARGB(135, 255, 255, 255),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
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
                itemCount: orignal.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      indexs = orignal[index]['id'] - 1;

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
                                      orignal[index]['image'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            subtitle: Text(
                              "${orignal[index]['Name']}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              "${orignal[index]['sName']}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: (!flag) ? Colors.white : Colors.blue),
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
