import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State createState() => _Assignment1State();
}

class ModelClass {
  String? title;
  String? dis;
  String? date;

  ModelClass({this.title, this.dis, this.date});
}

class _Assignment1State extends State {
  List<ModelClass> addcard = [
    ModelClass(
        title: "Submit Assignment",
        dis: "Submit Assignment before yesterday",
        date: "2024-02-29"),
  ];
  List<Color> color = const [
    Color.fromRGBO(250, 232, 232, 1),
    Color.fromRGBO(232, 237, 250, 1),
    Color.fromRGBO(250, 249, 232, 1),
    Color.fromRGBO(250, 232, 250, 1),
  ];

  TextEditingController title = TextEditingController();
  TextEditingController dis = TextEditingController();
  TextEditingController date = TextEditingController();

  bool tflag = false;
  bool disflag = false;
  bool dateflag = false;

  void showSheet(bool flag, int index) {
    if (flag == false) {
      title.text = addcard[index].title!;
      dis.text = addcard[index].dis!;
      date.text = addcard[index].date!;
    }
    tflag = false;
    disflag = false;
    dateflag = false;

    print("n njjjj");
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (context) {
          // return StatefulBuilder(
          //     builder: (BuildContext context, StateSetter setState) {
          //   return
          return Padding(
            padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Create Task",
                  style: GoogleFonts.quicksand(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: title,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    tflag == true
                        ? const Text(
                            "Please Enter the Title",
                            style: TextStyle(color: Colors.red),
                          )
                        : const Text(""),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: dis,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    disflag == true
                        ? const Text(
                            "Please Enter the Discription",
                            style: TextStyle(color: Colors.red),
                          )
                        : const Text(""),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: date,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? picDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2034),
                        );

                        String Dformat =
                            DateFormat("yyyy-mm-dd").format(picDate!);

                        setState(() {
                          date.text = Dformat;
                        });
                      },
                    ),
                    dateflag == true
                        ? const Text(
                            "Please Enter the Date",
                            style: TextStyle(color: Colors.red),
                          )
                        : const Text(""),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () {
                      if (flag == true) {
                        if (title.text.trim().isNotEmpty &&
                            dis.text.trim().isNotEmpty &&
                            date.text.trim().isNotEmpty) {
                          addcard.add(ModelClass(
                              title: title.text,
                              dis: dis.text,
                              date: date.text));
                          title.clear();
                          dis.clear();
                          date.clear();
                          setState(() {});

                          Navigator.pop(context, setState);
                          print(addcard);
                        } else {
                          setState(() {
                            if (title.text.trim().isEmpty) {
                              print("Exceute");
                              tflag = true;
                            }
                            if (dis.text.trim().isEmpty) {
                              disflag = true;
                            }
                            if (date.text.trim().isEmpty) {
                              dateflag = true;
                            }
                          });
                        }
                      } else {
                        if (title.text.trim().isNotEmpty &&
                            dis.text.trim().isNotEmpty &&
                            date.text.trim().isNotEmpty) {
                          addcard[index].title = title.text;
                          addcard[index].dis = dis.text;
                          addcard[index].date = date.text;
                          title.clear();
                          dis.clear();
                          date.clear();
                          Navigator.pop(context, setState);
                        }
                      }

                      setState(() {});
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(2, 167, 177, 1))),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        title: Text(
          "To-Do List",
          style:
              GoogleFonts.quicksand(fontSize: 26, fontWeight: FontWeight.w700),
        ),
      ),
      body: addcard.length > 0
          ? ListView.builder(
              itemCount: addcard.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    // height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: color[index % color.length],
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(5, 7),
                            blurRadius: 2)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://media.istockphoto.com/id/1303877287/vector/paper-checklist-and-pencil-flat-pictogram.jpg?s=612x612&w=0&k=20&c=NoqPzn94VH2Pm7epxF8P5rCcScMEAiGQ8Hv_b2ZwRjY="))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${addcard[index].title}",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${addcard[index].dis}",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            84, 84, 84, 1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              Text(
                                "${addcard[index].date}",
                                style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(84, 84, 84, 1)),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  showSheet(false, index);
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addcard.removeAt(index);
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
              "Nothing to do",
              style: GoogleFonts.quicksand(
                  fontSize: 30, fontWeight: FontWeight.w800),
            )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        onPressed: () {
          showSheet(true, -1);
        },
        child: const Icon(
          Icons.add,
          size: 55,
        ),
      ),
    );
  }
}
