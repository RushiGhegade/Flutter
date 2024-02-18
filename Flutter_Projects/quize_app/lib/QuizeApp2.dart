// Using Model calss

import "package:flutter/material.dart";

class QuizeApp2 extends StatefulWidget {
  const QuizeApp2({super.key});

  @override
  State<QuizeApp2> createState() => _QuizeApp2();
}

class ModelClass {
  final String? Quetions;
  final List<String>? Options;
  final int? RightAns;

  const ModelClass({this.Quetions, this.Options, this.RightAns});
}

class _QuizeApp2 extends State<QuizeApp2> {
  int showQueScreen = 0;
  int queIndex = 0;
  int OptionInd = -1;

  List allQuetions = [
    const ModelClass(
      Quetions: "who Created Flutter ?",
      Options: ["Facebook", "Adobe", "Goggle", "Microsoft"],
      RightAns: 2,
    ),
    const ModelClass(
      Quetions: "What are the features of Flutter ?",
      Options: [
        "Fast development",
        "Huge Widget catalog",
        "High-performance application",
        "All of the above"
      ],
      RightAns: 2,
    ),
    const ModelClass(
      Quetions: "What does SDK Stands for ?",
      Options: [
        "Software Data Kit",
        "Software Database Kit",
        "Software Development Kit",
        "None of the above"
      ],
      RightAns: 2,
    ),
    const ModelClass(
      Quetions:
          "which of the following widget is used for repeating content in flutter ?",
      Options: ["ListView", "ArrayView", "ExpandedView", "Non of the above"],
      RightAns: 0,
    ),
    const ModelClass(
      Quetions: "Which programming language is used by flutter ?",
      Options: ["Java", "Dart", "Kotlin", "Ruby"],
      RightAns: 1,
    ),
  ];
  int mark = 0;
  MaterialStatePropertyAll<Color?>? ShowColor(int option) {
    if (OptionInd != -1) {
      if (option == allQuetions[queIndex].RightAns) {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 27, 210, 33));
      } else if (OptionInd == option) {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 198, 27, 21));
      } else {
        return const MaterialStatePropertyAll(Color.fromARGB(255, 25, 68, 95));
      }
    } else {
      return const MaterialStatePropertyAll(Color.fromARGB(255, 25, 68, 95));
      ;
    }
  }

  Scaffold ShowScreen() {
    if (showQueScreen == 1) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 215, 13, 181),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Quize App",
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.w800, color: Colors.red),
          ),
        ),
        body: Container(
          height: 800,
          width: 430,
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(width: 2),
            // borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Quetions : ",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${queIndex + 1} / ${allQuetions.length}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   width: 84,
                  // ),
                  Container(
                    height: 2,
                    width: 240,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 100,
                width: 370,
                // color: Colors.red,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(10, 10),
                          blurRadius: 9)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.black)),
                child: Text(
                  "${allQuetions[queIndex].Quetions}",
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 340,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: ShowColor(0)),
                  onPressed: () {
                    if (OptionInd == -1) {
                      setState(() {
                        OptionInd = 0;
                      });
                    }
                  },
                  child: Text("A .${allQuetions[queIndex].Options[0]}"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: 340,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: ShowColor(1)),
                  onPressed: () {
                    if (OptionInd == -1) {
                      setState(() {
                        OptionInd = 1;
                      });
                    }
                  },
                  child: Text("B .${allQuetions[queIndex].Options[1]}"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: 340,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: ShowColor(2)),
                  onPressed: () {
                    if (OptionInd == -1) {
                      setState(() {
                        OptionInd = 2;
                      });
                    }
                  },
                  child: Text("C .${allQuetions[queIndex].Options[2]}"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: 340,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: ShowColor(3)),
                  onPressed: () {
                    if (OptionInd == -1) {
                      setState(() {
                        OptionInd = 3;
                      });
                    }
                  },
                  child: Text("D .${allQuetions[queIndex].Options[3]}"),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (OptionInd == -1) {
              return;
            }
            if (OptionInd == allQuetions[queIndex].RightAns) {
              mark++;
            }

            if (queIndex == allQuetions.length - 1) {
              setState(() {
                showQueScreen = 2;
              });
            }
            setState(() {
              queIndex++;
              OptionInd = -1;
            });
          },
          child: const Text("Next"),
        ),
      );
    } else if (showQueScreen == 2) {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 135, 7, 195),
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
                  height: 160,
                  width: 200,
                  child: Image.asset(
                    "lib/Images/tro.jpg",
                    width: 20,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Congratulations",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Your Score",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
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
                  height: 20,
                ),
                const Text(
                  "You did a great job in the quize !",
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 24, 244),
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showQueScreen = 1;
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
                      onPressed: () {
                        setState(() {
                          showQueScreen = 0;
                          queIndex = 0;
                          mark = 0;
                        });
                      },
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
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 142, 35, 243),
        body: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   "lib/Images/qi.webp",
                //   height: 200,
                //   width: 500,
                // ),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 117, 19, 216)),
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 44, 50, 37),
                      image: const DecorationImage(
                          image: AssetImage(
                            "lib/Images/qi.webp",
                          ),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            const SizedBox(
              child: Text(
                "Quizzle",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showQueScreen = 1;
                      });
                    },
                    style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(330, 50)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          "Start",
                          style: TextStyle(
                              color: Color.fromARGB(255, 179, 5, 232),
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward,
                          color: Color.fromARGB(255, 179, 5, 232),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShowScreen();
  }
}
