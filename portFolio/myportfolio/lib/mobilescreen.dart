import 'package:flutter/material.dart';

import 'Projectscreen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.04,
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi !",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.079,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.0012, //20,
            ),
            Text(
              "I'm Rushikesh Ghegade",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06, //40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.00999,
            ),
            Text(
              "Android | Flutter Developer",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04, // 31,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.029,
            ),
            Text(
              textAlign: TextAlign.justify, // Left-align the text
              // overflow: TextOverflow.visible,
              "Passionate Flutter developer with a strong foundation in building cross-platform mobile applications. Skilled in UI/UX design, state management, and API integration, I create responsive and user-friendly apps. Eager to contribute to innovative projects and grow as a developer",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.025,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.058,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyProjects();
            }));
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.0089,
                horizontal: MediaQuery.of(context).size.width * 0.00899),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.059),
              border: Border.all(color: Colors.white),
            ),
            child: Text(
              "Explore My Work",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.039,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.058,
        ),
        Container(
          height: MediaQuery.of(context).size.width * 0.44,
          width: MediaQuery.of(context).size.width * 0.44,
          child: Image.network(
              fit: BoxFit.cover,
              "https://static-00.iconduck.com/assets.00/flutter-icon-256x256-ngd48v7a.png"),
        ),
      ],
    );
  }
}
