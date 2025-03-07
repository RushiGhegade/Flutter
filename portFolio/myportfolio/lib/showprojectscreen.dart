import 'package:flutter/material.dart';
import 'package:myportfolio/exploreProjects.dart';

import 'main.dart';

class ShowProjects extends StatefulWidget {
  const ShowProjects({super.key});

  @override
  State<ShowProjects> createState() => _ShowProjectsState();
}

class _ShowProjectsState extends State<ShowProjects> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: 200,
        //   width: MediaQuery.of(context).size.width,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     shrinkWrap: true,
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         margin: EdgeInsets.all(10),
        //         height: 100,
        //         width: 100,
        //         color: Colors.white,
        //       );
        //     },
        //   ),
        // )

        GridView.builder(
          shrinkWrap: true,
          itemCount: projectInfo.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // mainAxisExtent: 200,
              crossAxisCount:
                  (MediaQuery.of(context).size.width >= 520) ? 3 : 2,
              mainAxisSpacing: MediaQuery.of(context).size.width * 0.018,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.018),
          itemBuilder: (context, index) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProjectExplore(index: index);
                      },
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            // border: Border.all(color: Colors.white)),
                          ),
                          child: Image.asset(
                            projectInfo[index]['images'][0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spacer(),
                        Center(
                            child: Text(
                          projectInfo[index]['name'],
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
