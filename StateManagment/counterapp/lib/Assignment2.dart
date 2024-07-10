import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  State createState() {
    return Assignment2State();
  }
}

class Assignment2State extends State {
  int javaCount = 0;
  int flutterCount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      javaCount++;
                      setState(() {});
                    },
                    child: const Text("JAVA"),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text("$javaCount")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      flutterCount++;
                      setState(() {});
                    },
                    child: const Text("Flutter"),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text("$flutterCount")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
