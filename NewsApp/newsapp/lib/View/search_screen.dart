import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Api/apiOperation.dart';
import 'package:newsapp/model/newsProviderclass.dart';
import 'package:newsapp/model/savedatamodelclass.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_screen.dart';
import 'showNewsOnWeb.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = false;

  TextEditingController _textEditingController = TextEditingController();

  String str = "trending";

  @override
  void initState() {
    // TODO: implement initState
    serachResult(str).then((value) => {
          setState(() {
            isSearching = true;
          })
        });
    super.initState();
  }

  Future<void> serachResult(String result) async {
    try {
      Map getdata = await GetApiData.searchData(result);
      Provider.of<News>(context, listen: false).changeNewsData(getdata);
      isSearching = true;
      log("$getdata");
      setState(() {});
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
      appBar: MyBottomNavigation.myAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: _textEditingController,
                  onFieldSubmitted: (v) {
                    if (v.toString().isNotEmpty) {
                      isSearching = false;
                      log("yes");
                      setState(() {});
                      serachResult(v.toString().trim());
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Your News",
                      enabled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 7,
              ),
              (isSearching)
                  ? (Provider.of<News>(context).newsData['totalResults'] != 0)
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
                                        String url = Provider.of<News>(context)
                                            .newsData['articles'][index]['url'];
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
                                                          .newsData["articles"]
                                                      [index]["urlToImage"] !=
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
                                              errorBuilder:
                                                  (context, error, stackTrace) {
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
                                                          .newsData["articles"]
                                                      [index]["description"] !=
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
                                                Map _mymap = Provider.of<News>(
                                                            context,
                                                            listen: false)
                                                        .newsData["articles"]
                                                    [index];
                                                String key = _mymap["title"];
                                                if (containsKey(key)) {
                                                  removeKey(key);
                                                  log("Remove Sucessfully");
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          content: Text(
                                                              "News Remove")));
                                                } else {
                                                  SaveData obj = new SaveData(
                                                      name: _mymap['source']
                                                          ['name'],
                                                      author: _mymap['author'],
                                                      title: _mymap['title'],
                                                      discriptipn:
                                                          _mymap['description'],
                                                      url: _mymap['url'],
                                                      urlToImage:
                                                          _mymap['urlToImage'],
                                                      publishAt: _mymap[
                                                          'publishedAt']);

                                                  addEntry(key, obj);
                                                  log("Add Sucessfully");
                                                  ScaffoldMessenger.of(context)
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
                          child: Center(
                            child: Text(
                              "No Result Found",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                  : Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          )),
      bottomNavigationBar: MyBottomNavigation.myBottomNavigationBar(context),
    );
  }
}
