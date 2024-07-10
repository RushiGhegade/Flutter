import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'screen2.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const  Color.fromARGB(232, 32, 168, 247),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Lottie.asset("lib/images/done1.json"),
            const Spacer(
              flex: 3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageTransition(
                    child: const Screen2(),
                    type: PageTransitionType.rightToLeft));
              },
              child: Container(
                height: 40,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 75, 64, 172),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
