import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class todoapp extends StatefulWidget {
  const todoapp({super.key});

  @override
  State createState() => _todoappState();
}

class ModelClass {
  String? title;
  String? dis;
  String? date;

  ModelClass({this.title, this.dis, this.date});
}

class _todoappState extends State {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _dis = TextEditingController();
  final TextEditingController _date = TextEditingController();

  List<ModelClass> task = [
    // ModelClass(
    //     title: "Submit Assignment",
    //     dis: "Submit Assignment before yesterday",
    //     date: "2024-02-29"),
  ];

  List<Color> color = const [
    Color.fromRGBO(250, 232, 232, 1),
    Color.fromRGBO(232, 237, 250, 1),
    Color.fromRGBO(250, 249, 232, 1),
    Color.fromRGBO(250, 232, 250, 1),
  ];

  void adddata(bool flag, [ModelClass? obj]) {
    if (flag) {
      if (_title.text.trim().isNotEmpty &&
          _dis.text.trim().isNotEmpty &&
          _date.text.trim().isNotEmpty) {
        task.add(ModelClass(
            title: _title.text.trim(),
            dis: _dis.text.trim(),
            date: _date.text.trim()));
      }
    } else {
      obj!.title = _title.text;
      obj.dis = _dis.text;
      obj.date = _date.text;
    }

    navgatorpop();
  }

  void navgatorpop() {
    _title.clear();
    _dis.clear();
    _date.clear();
    Navigator.pop(context);
  }

  void showSheet(bool flag, [ModelClass? obj]) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Create Task",
              style: GoogleFonts.quicksand(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 27,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  controller: _title,
                  decoration: const InputDecoration(
                    hintText: "Enter the title",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                  controller: _dis,
                  decoration: const InputDecoration(
                    hintText: "Enter the Description",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                  readOnly: true,
                  onTap: () async {
                    DateTime? picDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025),
                    );

                    // String Dformat = DateFormat("yyyy-mm-dd").format(picDate!);

                    String Dformat = DateFormat("dd-MM-yyyy").format(picDate!);

                    setState(() {
                      _date.text = Dformat;
                    });
                  },
                  controller: _date,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                    hintText: "Enter the Date",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  if (flag) {
                    adddata(flag);
                  } else {
                    adddata(flag, obj);
                  }
                  setState(() {});
                },
                child: Text(
                  "Submit",
                  style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void deletedata(ModelClass obj) {
    task.remove(obj);
    setState(() {});
  }

  void editdata(ModelClass obj) {
    _title.text = obj.title!;
    _dis.text = obj.dis!;
    _date.text = obj.date!;

    showSheet(false, obj);
  }

  // Controller
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cpassword = TextEditingController();

  // Key
  final GlobalKey<FormFieldState> _usernamekey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordkey = GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> _usernamekeysign =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordkeysign =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _compasswordkey = GlobalKey<FormFieldState>();

  bool checkvalidity(bool flag) {
    if (flag) {
      bool user = _usernamekey.currentState!.validate();
      bool pass = _passwordkey.currentState!.validate();
      if (user && pass) {
        return true;
      } else {
        return false;
      }
    } else {
      bool user = _usernamekeysign.currentState!.validate();
      bool pass = _passwordkeysign.currentState!.validate();
      bool cpass = _compasswordkey.currentState!.validate();
      if (user && pass && cpass) {
        return true;
      } else {
        return false;
      }
    }
  }

  int showscreen = 0;
  bool showpass = false;
  bool showpasssign = false;
  bool showcompass = false;

  HashMap<String, String> map = HashMap();

  Scaffold showscaffold() {
    if (showscreen == 0) {
      return Scaffold(
        backgroundColor: Colors.white, //Color.fromARGB(255, 7, 3, 31),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Container(
                      height: 210,
                      // width: 410,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage("lib/loginpageimg/lock1.jpg"))),
                      // color: Colors.red,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          "Welcome TO-Do List App",
                          style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: _usernamekey,
                      controller: _username,
                      validator: (value) {
                        if (value == null || !map.containsKey(value)) {
                          return "Please Enter Valid Username";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 89, 87, 87),
                        ),
                        hintText: "Enter username",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 89, 87, 87)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: _passwordkey,
                      controller: _password,
                      obscureText: !showpass,
                      validator: (value) {
                        if (value == null || !map.containsValue(value)) {
                          return "Please Enter valid Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 89, 87, 87),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showpass = !showpass;
                            setState(() {});
                          },
                          child: Icon(
                            (showpass)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color.fromARGB(255, 89, 87, 87),
                          ),
                        ),
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 89, 87, 87)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    const Color.fromARGB(255, 33, 97, 236),
                                fixedSize: const Size(390, 50)),
                            onPressed: () {
                              if (checkvalidity(true)) {
                                showscreen = 1;
                                const snackBar = SnackBar(
                                  content: Text("Log in Successfully"),
                                  backgroundColor:
                                      Color.fromARGB(255, 36, 193, 18),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                // print(showscreen);
                              }

                              showpass = false;
                              setState(() {});
                            },
                            child: Text("Login",
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            width: 310,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Dont have an Account",
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _username.clear();
                              _password.clear();
                              showscreen = 2;
                              showcompass = false;
                              showpasssign = false;
                              setState(() {});
                            },
                            child: Text(
                              "Sign in",
                              style: GoogleFonts.quicksand(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromARGB(255, 33, 97, 236)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else if (showscreen == 1) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                showscreen = 0;
                _username.clear();
                _password.clear();
                setState(() {});
              },
              child: const Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 18, 7, 69),
                  ),
                  Text(
                    "Log out",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
          backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
          title: Text(
            "To-do list",
            style: GoogleFonts.quicksand(
                fontSize: 26, fontWeight: FontWeight.w700),
          ),
        ),
        body: task.length > 0
            ? ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 14),
                    // height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: color[index % color.length],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(0, 0, 0, 1),
                            offset: Offset(10, 10),
                            blurRadius: 10)
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              margin: const EdgeInsets.only(top: 13, left: 10),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("lib/Image/todo1.jpg")),
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 240,
                                  child: Text(
                                    "${task[index].title}",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    width: 240,
                                    child: Text(
                                      "${task[index].dis}",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              84, 84, 84, 1)),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${task[index].date}",
                              style: GoogleFonts.quicksand(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(84, 84, 84, 1)),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  editdata(task[index]);
                                },
                                child: const Icon(
                                  Icons.edit,
                                  size: 22,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                )),
                            const SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                                onTap: () {
                                  deletedata(task[index]);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  size: 22,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                )),
                            const SizedBox(
                              width: 7,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                      ],
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/Image/tree2.png",
                      height: 190,
                      width: 190,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Nothing to do",
                      style: GoogleFonts.quicksand(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(task);
            setState(() {
              showSheet(true);
            });
          },
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white, //Color.fromARGB(255, 7, 3, 31),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 110,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 140,
                        ),
                        Text(
                          "Sing in",
                          style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      key: _usernamekeysign,
                      controller: _username,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Valid Username";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 89, 87, 87),
                        ),
                        hintText: "Enter username",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 89, 87, 87)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: _passwordkeysign,
                      controller: _password,
                      obscureText: !showpasssign,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter valid Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 89, 87, 87),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showpasssign = !showpasssign;
                            setState(() {});
                          },
                          child: Icon(
                            (showpasssign)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 89, 87, 87),
                          ),
                        ),
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 89, 87, 87)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: _compasswordkey,
                      controller: _cpassword,
                      obscureText: !showcompass,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value != _password.text) {
                          return "Please Enter Correct Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 89, 87, 87),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showcompass = !showcompass;
                            setState(() {});
                          },
                          child: Icon(
                            (showcompass)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 89, 87, 87),
                          ),
                        ),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 89, 87, 87)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    const Color.fromARGB(255, 33, 97, 236),
                                fixedSize: const Size(390, 50)),
                            onPressed: () {
                              if (checkvalidity(false)) {
                                map.addAll({_username.text: _password.text});
                                print(map);
                                _username.clear();
                                _password.clear();
                                _cpassword.clear();
                                showscreen = 0;
                                final snackBar = SnackBar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 36, 193, 18),
                                  content: const Text("sign succesfully"),
                                  action: SnackBarAction(
                                      label: 'undo', onPressed: () {}),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              showcompass = false;
                              showpasssign = false;
                              setState(() {});
                            },
                            child: Text("Sign in",
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)))
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: 1,
                            width: 310,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Already have an Account",
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _username.clear();
                              _password.clear();
                              _cpassword.clear();
                              showscreen = 0;
                              showpass = false;
                              setState(() {});
                            },
                            child: Text(
                              "Log in",
                              style: GoogleFonts.quicksand(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromARGB(255, 33, 97, 236)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    map.addAll({"Rushi": "Rushi@123"});
    return showscaffold();
  }
}
