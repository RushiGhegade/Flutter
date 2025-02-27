import 'dart:developer';

import 'package:courceapp/Payment/paymentMethod.dart';
import 'package:courceapp/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../ModelClasses/corcedatamodelclass.dart';
import 'show_lecture.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? _selectvedio;
  List<CourceDataModel> myPurchesCource = [];
  List<CourceDataModel> language = [];
  List<CourceDataModel> frontend = [];
  List<CourceDataModel> backend = [];
  List<CourceDataModel> searchResult = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    getLanguageData();
    searchResult.clear();
    super.initState();
  }

  void getLanguageData() {
    List<CourceDataModel> getdata = [];
    if (Provider.of<LectureData>(context, listen: false).lectureData != null) {
      getdata = Provider.of<LectureData>(context, listen: false).lectureData!;
    }

    log("$getdata");
    for (int i = 0; i < getdata.length; i++) {
      if (getdata[i].courceEnrol != null) {
        if (getdata[i].courceEnrol!.contains('Language Cources')) {
          language.add(getdata[i]);
        } else if (getdata[i].courceEnrol!.contains('Frontend Cources')) {
          frontend.add(getdata[i]);
        } else if (getdata[i].courceEnrol!.contains('Backend Cources')) {
          backend.add(getdata[i]);
        }
        if (getdata[i]
            .courcePurchesBy!
            .contains('ghegaderushikesh065@gmail.com')) {
          myPurchesCource.add(getdata[i]);
        }
        // log("${getdata}");
      }
    }
  }

  void findMySearch(String value) {
    searchResult.clear();
    List<CourceDataModel> myList = [];

    for (int i = 0; i < list.length; i++) {
      if (list[i].courceName!.toLowerCase().contains(value.toLowerCase())) {
        log("Find ");
        if (!myList.contains(list[i])) {
          myList.add(list[i]);
        }
      }
    }
    setState(() {
      searchResult = myList;
      log("$myList");
    });
  }

  @override
  Widget build(BuildContext context) {
    // log("${Provider.of<LectureData>(context, listen: false).lectureData![0]}");
    // log("-----------$searchResult");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the top section
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 185,
            floating: false,
            // backgroundColor: const Color.fromARGB(255, 61, 78, 232),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              collapseMode: CollapseMode.pin,
              title: Text(
                'Hii Rushi',
                style: TextStyle(
                    color: const Color.fromARGB(255, 61, 78, 232),
                    fontSize: 19),
              ),
              background: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 61, 78, 232),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hii Rushi",
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              "Lets Start Learning",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 43, 53, 143),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.qr_code_2,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        controller: textEditingController,
                        onChanged: (value) {
                          log("$value");
                          findMySearch(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Search For Topics & Cource",
                          hintStyle: TextStyle(fontSize: 15),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                            color: const Color.fromARGB(255, 61, 78, 232),
                          ),
                          suffixIcon: (searchResult.isEmpty)
                              ? Icon(
                                  Icons.article,
                                  size: 25,
                                  color: const Color.fromARGB(255, 61, 78, 232),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    searchResult.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 35,
                                    // fill: 10,
                                    color:
                                        const Color.fromARGB(255, 61, 78, 232),
                                  ),
                                ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SliverList for the courses content
          (searchResult.isEmpty)
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index1) {
                      // Adjust index logic based on your categories
                      String category;
                      List<CourceDataModel> categoryData;

                      if (index1 == 0) {
                        category = "My Courses";
                        categoryData = myPurchesCource;
                      } else if (index1 == 1) {
                        category = "Language Courses";
                        categoryData = language;
                      } else if (index1 == 2) {
                        category = "Frontend Courses";
                        categoryData = frontend;
                      } else {
                        category = "Backend Courses";
                        categoryData = backend;
                      }

                      return Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: textshow(category, 1),
                            ),
                            categoryData.isEmpty
                                ? Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Courses Available",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                : Container(
                                    height: 286,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: categoryData.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Provider.of<LectureData>(context,
                                            //         listen: false)
                                            //     .selectCource = categoryData[index];
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => ShowLecture(),
                                            //   ),
                                            // );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 25),
                                            child: showCource(categoryData,
                                                index1, index, context),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      );
                    },
                    childCount:
                        4, // 4 categories: My Courses, Language, Frontend, Backend
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: searchResult.length, (context, index1) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        height: 320,
                        child: GestureDetector(
                            onTap: () {
                              // Provider.of<LectureData>(context,
                              //         listen: false)
                              //     .selectCource = categoryData[index];
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ShowLecture(),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 25),
                              child: showSearchCource(
                                  searchResult[index1], index1, context),
                            )),
                      )
                    ],
                  );
                })),
        ],
      ),
    );
  }
}

Widget textshow(String textname, int number) {
  return Row(
    children: [
      Text(
        textname,
        style: TextStyle(
            fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      Spacer(),
      // Text(
      //   "See all",
      //   style: TextStyle(
      //       fontSize: 19,
      //       fontWeight: FontWeight.w700,
      //       color: const Color.fromARGB(255, 61, 78, 232)),
      // ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}

Widget showSearchCource(
    CourceDataModel categoryData, int index, BuildContext context) {
  List<String> getlist = [
    "Language Cources",
    "Frontend Cources",
    "Backend Cources"
  ];

  return Container(
    width: 260,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 61, 60, 60),
          offset: Offset(0, 0),
          blurRadius: 4,
        ),
      ],
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 260,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(categoryData.image!),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryData.courceName!,
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      textCource(
                          "20", const Color.fromARGB(255, 16, 38, 239), 18),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("Topic", Colors.black, 18),
                      // Spacer(),
                      SizedBox(
                        width: 25,
                      ),
                      textCource(
                          "53", const Color.fromARGB(255, 16, 38, 239), 18),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("Lecture", Colors.black, 18)
                    ],
                  ),
                  Row(
                    children: [
                      textCource(
                          "10", const Color.fromARGB(255, 16, 38, 239), 18),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("Notes", Colors.black, 18),
                      // Spacer(),
                      SizedBox(
                        width: 25,
                      ),
                      textCource(
                          "60", const Color.fromARGB(255, 16, 38, 239), 18),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("MCQ Quize", Colors.black, 18)
                    ],
                  ),
                  Text(
                    (index != 0) ? "\$ 4000" : "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                log("$index");
                log("${categoryData.courceEnrol!}");

                if (categoryData.courceEnrol!.contains("My Cources")) {
                  Provider.of<LectureData>(context, listen: false)
                      .selectCource = categoryData;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowLecture(),
                    ),
                  );
                } else {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return BuyCource(name: getlist[index - 1], val: myIndex);
                  //   },
                  // ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                      content: Text(
                        "Purches Cource",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      )));
                }
              },
              child: Container(
                height: 40,
                width: 260,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(19),
                        topRight: Radius.circular(19)),
                    color: const Color.fromARGB(255, 0, 140, 255)),
                child: Text(
                  (categoryData.courceEnrol!.contains("My Cources"))
                      ? "Start"
                      : "Buy Now",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget showCource(List<CourceDataModel> categoryData, int index, int myIndex,
    BuildContext context) {
  List<String> getlist = [
    "Language Cources",
    "Frontend Cources",
    "Backend Cources"
  ];

  return Container(
    width: 230,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 61, 60, 60),
          offset: Offset(0, 0),
          blurRadius: 4,
        ),
      ],
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(categoryData[myIndex].image!),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryData[myIndex].courceName!,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      textCource(
                          "20", const Color.fromARGB(255, 16, 38, 239), 15),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("Topic", Colors.black, 15),
                      // Spacer(),
                      SizedBox(
                        width: 25,
                      ),
                      textCource(
                          "53", const Color.fromARGB(255, 16, 38, 239), 15),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("Lecture", Colors.black, 15)
                    ],
                  ),
                  Row(
                    children: [
                      textCource(
                          "10", const Color.fromARGB(255, 16, 38, 239), 15),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("Notes", Colors.black, 15),
                      // Spacer(),
                      SizedBox(
                        width: 25,
                      ),
                      textCource(
                          "60", const Color.fromARGB(255, 16, 38, 239), 15),
                      SizedBox(
                        width: 7,
                      ),
                      textCource("MCQ Quize", Colors.black, 15)
                    ],
                  ),
                  Text(
                    (index != 0) ? "\$ 4000" : "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                log("$index");
                if (index == 0) {
                  Provider.of<LectureData>(context, listen: false)
                      .selectCource = categoryData[myIndex];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowLecture(),
                    ),
                  );
                } else {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      // return Paymentmethod();
                      // return PaymentMethod(
                      // name: getlist[index - 1], val: myIndex);
                      return Paymentmethod(
                          name: getlist[index - 1],
                          val: myIndex,
                          courceName: categoryData[myIndex].courceName!);
                    },
                  ));
                }
              },
              child: Container(
                height: 40,
                width: 230,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(19),
                        topRight: Radius.circular(19)),
                    color: const Color.fromARGB(255, 0, 140, 255)),
                child: Text(
                  index == 0 ? "Start" : "Buy Now",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget textCource(String value, Color col, double size) {
  return Text(
    value,
    style: TextStyle(color: col, fontSize: size),
  );
}
