import 'package:flutter/material.dart';

class QuizeApp extends StatefulWidget {
  const QuizeApp({super.key});

  @override
  State<QuizeApp> createState() => _QuizeAppState();
}

class _QuizeAppState extends State<QuizeApp> {
  List<Map> allQuetions = [
    {
      "Quetions": "How is The Founder Of Microsoft",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": "Bill Getes",
    },
    {
      "Quetions": "How is The Founder Of Apple",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": "Steve Jobs",
    },
    {
      "Quetions": "How is The Founder Of Tesla",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": "Elone Musk",
    },
    {
      "Quetions": "How is The Founder Of Amezon",
      "Options": ["Steve Jobs", "Bill Getes", "Elone Musk", "Jeff Bezos"],
      "Rightans": "Jeff Bezos",
    },
    {
      "Quetions": "How is The Founder Of Google",
      "Options": ["Steve Jobs", "Larry Page", "Elone Musk", "Jeff Bezos"],
      "Rightans": "Larry Page",
    },
  ];
  bool showQue = true;
  int queInd = 0;

  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  bool wrongop1 = false;
  bool wrongop2 = false;
  bool wrongop3 = false;
  bool wrongop4 = false;
  bool select = false;
  int mark = 0;
  bool nextque = false;
  void retCorrectAns(int optionsind) {
    nextque = true;
    String ans = allQuetions[queInd]["Rightans"];
    String selectans = allQuetions[queInd]["Options"][optionsind];
    int Correct = allQuetions[queInd]["Options"].indexOf(ans);
    print(mark);
    if (select == false) {
      select = true;
      if (ans == selectans) {
        if (optionsind == 0) {
          option1 = true;
          mark++;
        } else if (optionsind == 1) {
          option2 = true;
          mark++;
        } else if (optionsind == 2) {
          option3 = true;
          mark++;
        } else {
          option4 = true;
          mark++;
        }
      } else {
        if (optionsind == 0) {
          wrongop1 = true;
          if (Correct == 0) {
            option1 = true;
          } else if (Correct == 1) {
            option2 = true;
          } else if (Correct == 2) {
            option3 = true;
          } else {
            option4 = true;
          }
        } else if (optionsind == 1) {
          wrongop2 = true;
          if (Correct == 0) {
            option1 = true;
          } else if (Correct == 1) {
            option2 = true;
          } else if (Correct == 2) {
            option3 = true;
          } else {
            option4 = true;
          }
        } else if (optionsind == 2) {
          wrongop3 = true;
          if (Correct == 0) {
            option1 = true;
          } else if (Correct == 1) {
            option2 = true;
          } else if (Correct == 2) {
            option3 = true;
          } else {
            option4 = true;
          }
        } else {
          wrongop4 = true;
          if (Correct == 0) {
            option1 = true;
          } else if (Correct == 1) {
            option2 = true;
          } else if (Correct == 2) {
            option3 = true;
          } else {
            option4 = true;
          }
        }
      }
    }

    // return true;
  }

  Scaffold retScaffold() {
    if (showQue) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 0, 140, 255),
          centerTitle: true,
          title: const Text(
            "Quize App",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.orange),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Quetions : ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Text("${queInd + 1} / ${allQuetions.length}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700)),
            ]),
            const SizedBox(
              height: 70,
            ),
            Text(
              allQuetions[queInd]["Quetions"],
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    retCorrectAns(0);
                  });
                },
                style: option1
                    ? option1
                        ? ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 2, 234, 10))
                        : ElevatedButton.styleFrom(backgroundColor: Colors.grey)
                    : wrongop1
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 9, 9))
                        : ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                child: Text(
                  "A.${allQuetions[queInd]["Options"][0]}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    retCorrectAns(1);
                  });
                },
                style: option2
                    ? option2
                        ? ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 2, 234, 10))
                        : ElevatedButton.styleFrom(backgroundColor: Colors.grey)
                    : wrongop2
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 9, 9))
                        : ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                child: Text(
                  "B.${allQuetions[queInd]["Options"][1]}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    retCorrectAns(2);
                  });
                },
                style: option3
                    ? option3
                        ? ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 2, 234, 10))
                        : ElevatedButton.styleFrom(backgroundColor: Colors.grey)
                    : wrongop3
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 9, 9))
                        : ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                child: Text(
                  "C.${allQuetions[queInd]["Options"][2]}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    retCorrectAns(3);
                  });
                },
                style: option4
                    ? option4
                        ? ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 2, 234, 10))
                        : ElevatedButton.styleFrom(backgroundColor: Colors.grey)
                    : wrongop4
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 9, 9))
                        : ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                child: Text(
                  "D.${allQuetions[queInd]["Options"][3]}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (nextque == true) {
                queInd++;

                option1 = false;
                option2 = false;
                option3 = false;
                option4 = false;
                wrongop1 = false;
                wrongop2 = false;
                wrongop3 = false;
                wrongop4 = false;
                select = false;
                if (queInd == allQuetions.length) {
                  showQue = false;
                }
                nextque = false;
              }
            });
          },
          child: const Icon(
            Icons.forward_outlined,
            color: Colors.orange,
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
                          showQue = true;
                          queInd = 0;
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
    return retScaffold();
  }
}
