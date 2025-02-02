import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/model/newsProviderclass.dart';
import 'package:newsapp/model/savedatamodelclass.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_screen.dart';
import 'showNewsOnWeb.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  bool isloading = true;

  List<SaveData> dataSave = [];
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
        Duration(seconds: 1),
        () => {
              setState(() {
                isflag = true;
              }),
            });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getdata();
  }

  void getdata() {
    dataSave = getAllValues(Provider.of<News>(context, listen: false).saveData);
    isloading = false;

    setState(() {});
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

  List<SaveData> getAllValues(List<Map<String, SaveData>> list) {
    return list.expand((map) => map.values).toList();
  }

  bool isflag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyBottomNavigation.myAppBar(),
      body: (!isflag)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  (!isloading)
                      ? (Provider.of<News>(context).saveData.isNotEmpty)
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: dataSave.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        log("Selected $index");
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            String url = dataSave[index].url!;
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
                                              dataSave[index].title!,
                                              style: GoogleFonts.anton(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Visibility(
                                              visible:
                                                  (dataSave[index].urlToImage !=
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
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.network(
                                                  dataSave[index]
                                                      .urlToImage
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
                                              visible:
                                                  dataSave[index].discriptipn !=
                                                          null
                                                      ? true
                                                      : false,
                                              child: Text(
                                                dataSave[index].discriptipn!,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    dataSave[index].name!,
                                                    style: GoogleFonts.sahitya(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 43, 42, 42),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Container(
                                                  // width: 170,
                                                  child: Text(
                                                    dataSave[index]
                                                        .publishAt!
                                                        .toString()
                                                        .substring(0, 10),
                                                    style: GoogleFonts.poppins(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 61, 60, 60),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    isloading = true;

                                                    String key =
                                                        dataSave[index].title!;
                                                    if (containsKey(key)) {
                                                      setState(() {
                                                        isflag = false;
                                                      });
                                                      removeKey(key);
                                                      getdata();
                                                      Future.delayed(
                                                          Duration(seconds: 1),
                                                          () => {
                                                                isflag = true,
                                                                setState(() {}),
                                                              });
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
                                                                  "News Remove")));
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    child: (containsKey(
                                                            dataSave[index]
                                                                .title!))
                                                        ? Icon(
                                                            Icons.bookmark,
                                                            size: 30,
                                                            color: Colors.red,
                                                            // color: Colors.blue,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .bookmark_border,
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
