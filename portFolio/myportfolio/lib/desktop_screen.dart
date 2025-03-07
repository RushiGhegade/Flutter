import 'package:flutter/material.dart';
import 'package:myportfolio/Projectscreen.dart';

class DeskTopScreen extends StatelessWidget {
  const DeskTopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.04,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi !",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.0012, //20,
                  ),
                  Text(
                    "I'm Rushikesh Ghegade",
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width * 0.032, //40,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.0099,
                  ),
                  Text(
                    "Android | Flutter Developer",
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width * 0.025, // 31,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.009,
                  ),
                  Text(
                    "Passionate Flutter developer with a strong foundation in building cross-platform mobile applications. Skilled in UI/UX design, state management, and API integration, I create responsive and user-friendly apps. Eager to contribute to innovative projects and grow as a developer",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.015,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.24,
              width: MediaQuery.of(context).size.width * 0.24,
              child: Image.network(
                  fit: BoxFit.cover,
                  "https://static-00.iconduck.com/assets.00/flutter-icon-256x256-ngd48v7a.png"),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.028,
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
                  fontSize: MediaQuery.of(context).size.width * 0.019,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

//https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTISH65W2XIyenVzH8c9ZytCjngag7xSW86TQ&s
