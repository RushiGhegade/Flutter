import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myportfolio/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectExplore extends StatefulWidget {
  int index;

  ProjectExplore({super.key, required this.index});

  @override
  State<ProjectExplore> createState() => _ProjectExploreState();
}

class _ProjectExploreState extends State<ProjectExplore> {
  Future<void> _launchGitLink(BuildContext context, String link) async {
    log("Click");

    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MyNavigationBar(),
              Text(
                "Project Name : ${projectInfo[widget.index]['name']}",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Code Link    : ",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _launchGitLink(
                          context, projectInfo[widget.index]['gitlink']);
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontSize: MediaQuery.of(context).size.width * 0.017,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Linkdin Link : ",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _launchGitLink(
                          context, projectInfo[widget.index]['linkdinlink']);
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontSize: MediaQuery.of(context).size.width * 0.017,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Project Informaion : ",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              Text(
                textAlign: TextAlign.justify,
                "${projectInfo[widget.index]['info']}",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.01,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Images: ",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: projectInfo[widget.index]['images'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      // height: 200,
                      child: Image.asset(
                          fit: BoxFit.cover,
                          projectInfo[widget.index]['images'][index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
