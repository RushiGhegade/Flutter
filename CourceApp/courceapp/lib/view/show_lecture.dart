import 'dart:developer';

import 'package:courceapp/view/home_screen.dart';
import 'package:courceapp/view/shoepdf.dart';
import 'package:courceapp/view/vedio_show.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

import '../ModelClasses/corcedatamodelclass.dart';
import '../main.dart';

class ShowLecture extends StatefulWidget {
  const ShowLecture({super.key});

  @override
  State<ShowLecture> createState() => _ShowLectureState();
}

class _ShowLectureState extends State<ShowLecture> {
  CourceDataModel? lecture;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    lecture = Provider.of<LectureData>(context, listen: false).selectCource;
  }

  List<String> showcontaint = ['Lectures', 'PDF', 'Quiz'];

  Widget LectureContent() {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 345,
            child: ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: lecture!.courceLecture!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return VedioStart(
                          image: lecture!.courceLecture![index],
                          name: lecture!.courceName!,
                        );
                      },
                    ));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(lecture!.image!),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lecture ${index + 1}",
                                    // lecture!.courceLecture![index]
                                    //     .substring(0, 10),
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // Spacer()
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(255, 153, 151, 151),
                        ),
                        SizedBox(
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
    );
  }

  Widget PDFContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: lecture!.courcePDF!.length,
            itemBuilder: (context, index) {
              String path = lecture!.courcePDF![index];
              String name = p.basename(path);
              log(name);
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ShowPDF(
                          path: lecture!.courcePDF![index],
                          name: "${lecture!.courceName} ${index + 1}");
                    },
                  ));
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 95,
                              width: 150,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 61, 78, 232),
                              ),
                              child: Text(
                                "Notes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  (lecture!.courceName!.length > 14)
                                      ? "${lecture!.courceName!.substring(0, 14)} ${index + 1}"
                                      : "${lecture!.courceName!} ${index + 1}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromARGB(255, 153, 151, 151),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget QuizContent() {
    return Center(child: Text("Quiz Content"));
  }

  @override
  Widget build(BuildContext context) {
    log("${Provider.of<LectureData>(context).selectCource!.courceName}");

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Stack(children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      lecture!.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ));
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 10),

                // Title Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Resource",
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // TabBar Section
                Container(
                  // color: Colors.white, // Background color for the TabBar
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Lectures (${lecture!.courceLecture!.length})'),
                      Tab(text: 'PDF (${lecture!.courcePDF!.length})'),
                      Tab(text: 'Quiz (0)'),
                    ],
                    indicatorColor:
                        Colors.orange, // Color of the active tab indicator
                    labelColor: Colors.orange, // Active tab text color
                    unselectedLabelColor:
                        Colors.black, // Inactive tab text color
                  ),
                ),

                // TabBarView Section
                Expanded(
                  child: TabBarView(
                    children: [
                      LectureContent(),
                      PDFContent(),
                      QuizContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
