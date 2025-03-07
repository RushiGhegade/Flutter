import 'package:flutter/material.dart';
import 'package:myportfolio/contact_us.dart';
import 'package:myportfolio/home_screen.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Flutter Portfolio",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.031,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Spacer(),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.0061,
                    horizontal: MediaQuery.of(context).size.width * 0.00899),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.059),
                  border: Border.all(color: Colors.white),
                ),
                child: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.016,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ContactUsPage();
                  },
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.0061,
                    horizontal: MediaQuery.of(context).size.width * 0.00899),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.059),
                  border: Border.all(color: Colors.white),
                ),
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.016,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
