import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Authentication/loginpage.dart';
import 'package:newsapp/View/bottom_navigation_screen.dart';
import 'package:newsapp/View/showNewsOnWeb.dart';
import 'package:newsapp/model/savedatamodelclass.dart';
import 'package:provider/provider.dart';

import '../Api/apiOperation.dart';
import '../model/newsProviderclass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getDataFromApi().then((value) => {
          setState(() {
            dataget = true;
          })
        });
    super.initState();
  }

  bool dataget = false;
  bool categoriesdataget = true;

  List categories = [
    "Headlines",
    "technology",
    "sports",
    "business",
    "health",
    "general",
    "entertainment",
    "science",
  ];
  final controller = PageController();

  int selectedIndex = 0;

  Future<void> getDataFromApi() async {
    try {
      Map newsData = await GetApiData.homeData();

      Provider.of<News>(context, listen: false).changeNewsData(newsData);
      log("$newsData");
      categoriesdataget = true;
    } catch (e) {
      log("$e");
    }
  }

  Future<void> getCategoriesData(String data) async {
    try {
      Map newsData = await GetApiData.categoryData(data);

      Provider.of<News>(context, listen: false).changeNewsData(newsData);
      log("$newsData");
      setState(() {
        categoriesdataget = true;
      });
    } catch (e) {
      log("$e");
    }
  }

  bool containsKey(String key) {
    List<Map<String, SaveData>> list =
        Provider.of<News>(context, listen: false).saveData;
    return list.any((map) => map.containsKey(key));
  }

  void removeKey(String key) {
    List<Map<String, SaveData>> list =
        Provider.of<News>(context, listen: false).saveData;
    list.removeWhere((map) => map.containsKey(key));
  }

  void addEntry(String key, SaveData obj) {
    List<Map<String, SaveData>> list =
        Provider.of<News>(context, listen: false).saveData;

    list.add({key: obj});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 252, 251, 249),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ));
              },
              child: Icon(Icons.logout)),
          SizedBox(
            width: 10,
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1.0),
          )),
        ),
        // backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        title: Text("World News"),
      ),
      body: (Provider.of<News>(context).newsData["totalResults"] == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 45,
                    color: Colors.red,
                  ),
                  Text(
                    "Data not found",
                    style: GoogleFonts.sahitya(fontSize: 30),
                  ),
                ],
              ),
            )
          : (dataget)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        // width: 10,
                        child: ListView.builder(
                          // padding: EdgeInsets.only(right: 10),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                categoriesdataget = false;
                                selectedIndex = index;
                                if (index == 0) {
                                  getDataFromApi();
                                } else {
                                  getCategoriesData(categories[index]);
                                }

                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10),
                                // height: 10,
                                // width: 50,
                                decoration: BoxDecoration(
                                    color: (index == selectedIndex)
                                        ? Colors.blue
                                        : const Color.fromARGB(
                                            255, 235, 231, 231),
                                    borderRadius: BorderRadius.circular(10)),

                                child: Text(categories[index].toUpperCase(),
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    (categoriesdataget)
                        ? Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: Provider.of<News>(context)
                                  .newsData["articles"]
                                  .length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      log("Selected $index");
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          String url =
                                              Provider.of<News>(context)
                                                      .newsData['articles']
                                                  [index]['url'];
                                          return ShowNewsOnWeb(
                                            index: index,
                                            url: url,
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            '${Provider.of<News>(context).newsData["articles"][index]["title"]}' ??
                                                "Not Available",
                                            style: GoogleFonts.anton(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Visibility(
                                            visible: (Provider.of<News>(context)
                                                                .newsData[
                                                            "articles"][index]
                                                        ["urlToImage"] !=
                                                    null)
                                                ? true
                                                : false,
                                            child: Container(
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Image.network(
                                                Provider.of<News>(context)
                                                    .newsData["articles"][index]
                                                        ["urlToImage"]
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    color: Colors.grey[200],
                                                    child: Icon(
                                                      Icons.broken_image,
                                                      color: Colors.grey,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Visibility(
                                            visible: Provider.of<News>(context)
                                                                .newsData[
                                                            "articles"][index]
                                                        ["description"] !=
                                                    null
                                                ? true
                                                : false,
                                            child: Text(
                                              "${Provider.of<News>(context).newsData["articles"][index]["description"]}}",
                                              style: GoogleFonts.sahitya(
                                                fontSize: 18,
                                                color: const Color.fromARGB(
                                                    255, 94, 93, 93),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 150,
                                                child: Text(
                                                  "${Provider.of<News>(context).newsData["articles"][index]["source"]["name"]}" ??
                                                      "Not Avilable",
                                                  style: GoogleFonts.sahitya(
                                                    color: const Color.fromARGB(
                                                        255, 43, 42, 42),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                // width: 170,
                                                child: Text(
                                                  " ${Provider.of<News>(context).newsData["articles"][index]["publishedAt"].toString().substring(0, 10)}" ??
                                                      "Not Available",
                                                  style: GoogleFonts.poppins(
                                                    color: const Color.fromARGB(
                                                        255, 61, 60, 60),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Map _mymap = Provider.of<
                                                                  News>(context,
                                                              listen: false)
                                                          .newsData["articles"]
                                                      [index];
                                                  String key = _mymap["title"];
                                                  if (containsKey(key)) {
                                                    removeKey(key);
                                                    log("Remove Sucessfully");
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            content: Text(
                                                                "Remove")));
                                                  } else {
                                                    SaveData obj = new SaveData(
                                                        name: _mymap['source']
                                                            ['name'],
                                                        author:
                                                            _mymap['author'],
                                                        title: _mymap['title'],
                                                        discriptipn: _mymap[
                                                            'description'],
                                                        url: _mymap['url'],
                                                        urlToImage: _mymap[
                                                            'urlToImage'],
                                                        publishAt: _mymap[
                                                            'publishedAt']);

                                                    addEntry(key, obj);
                                                    log("Add Sucessfully");
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            content: Text(
                                                                "News Saved")));
                                                  }
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  child: (containsKey(Provider.of<
                                                                      News>(
                                                                  context,
                                                                  listen: false)
                                                              .newsData["articles"]
                                                          [index]["title"]))
                                                      ? Icon(
                                                          Icons.bookmark,
                                                          size: 30,
                                                          color: Colors.red,
                                                          // color: Colors.blue,
                                                        )
                                                      : Icon(
                                                          Icons.bookmark_border,
                                                          size: 30,
                                                        ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ),
                          )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
      bottomNavigationBar: MyBottomNavigation.myBottomNavigationBar(context),
    );
  }
}
