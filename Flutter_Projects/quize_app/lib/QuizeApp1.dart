import 'package:flutter/material.dart';

class QuizeApp1 extends StatefulWidget {
  const QuizeApp1({super.key});

  @override
  State<QuizeApp1> createState() => _QuizeApp1State();
}

class _QuizeApp1State extends State<QuizeApp1> {
  List<Map> allQuetions = [
    {
      "Quetions": "How is The Founder Of Microsoft ?",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": 1,
    },
    {
      "Quetions": "How is The Founder Of Apple",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": 0,
    },
    {
      "Quetions": "How is The Founder Of Tesla",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": 2,
    },
    {
      "Quetions": "How is The Founder Of Amezon",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": 3,
    },
    {
      "Quetions": "How is The Founder Of Google",
      "Options": ["Steve Jobs", "Larry Page", "Elone Musk", "Jeff Bezos"],
      "Rightans": 1,
    },
  ];
  int queIndex = 0;
  bool showSceen = false;
  int ButtonIndex = -1;
  bool flag = true;
  int mark = 0;
  MaterialStateProperty<Color?>? SetColor(int Option) {
    if (ButtonIndex != -1) {
      if (Option == allQuetions[queIndex]["Rightans"]) {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 22, 255, 5));
      } else if (ButtonIndex == Option) {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 248, 5, 5));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Scaffold ScreenShow() {
    if (showSceen == false) {
      return Scaffold(
        // backgroundColor: Color.fromARGB(255, 110, 103, 103),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Quize App",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.orange),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Quetion : ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Text("${queIndex + 1} / ${allQuetions.length}",
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w800))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "${allQuetions[queIndex]["Quetions"]}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            height: 40,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: SetColor(0)),
              onPressed: () {
                setState(() {
                  ButtonIndex = 0;
                });
              },
              child: Text("A. ${allQuetions[queIndex]["Options"][0]}"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: SetColor(1)),
              onPressed: () {
                setState(() {
                  ButtonIndex = 1;
                });
              },
              child: Text("B. ${allQuetions[queIndex]["Options"][1]}"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: SetColor(2)),
              onPressed: () {
                setState(() {
                  ButtonIndex = 2;
                });
              },
              child: Text("C. ${allQuetions[queIndex]["Options"][2]}"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 330,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: SetColor(3)),
              onPressed: () {
                setState(() {
                  ButtonIndex = 3;
                });
              },
              child: Text("D. ${allQuetions[queIndex]["Options"][3]}"),
            ),
          ),
          Text("${ButtonIndex}"),
          Text("${mark}"),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (ButtonIndex != -1) {
              if (ButtonIndex == allQuetions[queIndex]["Rightans"]) {
                mark++;
              }
              queIndex++;
              ButtonIndex = -1;
            }
            if (queIndex == allQuetions.length) {
              showSceen = true;
            }

            setState(() {});
          },
          child: const Text(
            "Next",
            style: TextStyle(color: Colors.orange, fontSize: 19),
          ),
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: Color.fromARGB(255, 48, 74, 223),
          body: Center(
              child: Container(
            height: 500,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(13)),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Icon(Icons.wine_bar_rounded),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    "lib/Images/trophy.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Congratulations",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Your Score",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$mark",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: mark > (allQuetions.length / 2)
                            ? const Color.fromARGB(255, 1, 251, 9)
                            : Colors.red,
                      ),
                    ),
                    const Text(
                      " / ",
                      style: TextStyle(fontSize: 33),
                    ),
                    Text(
                      "${allQuetions.length}",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "You did a great job in the quize !",
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 24, 244),
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showSceen = false;
                          queIndex = 0;
                          mark = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 8, 202, 14)),
                      child: const Text(
                        "Repeat",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 8, 202, 14)),
                      child: const Text("Home",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 17)),
                    ),
                  ],
                )
              ],
            ),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenShow();
  }
}
