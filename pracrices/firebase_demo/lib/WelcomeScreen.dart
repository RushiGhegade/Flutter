import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _firebasedb = FirebaseDatabase.instance.ref("Student Names");
  final NamesController = TextEditingController();
  bool isLoading = false;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 60,
          bottom: 40,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: NamesController,
              decoration: const InputDecoration(
                hintText: "Enter the Full Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(290, 50),
                backgroundColor: Colors.purple,
              ),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                _firebasedb.child(id).set({
                  "id": id,
                  "Name": NamesController.text.toString(),
                }).then((value) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Data Add Succussfully"),
                    ),
                  );
                  NamesController.clear();
                }).onError((error, stackTrace) {
                  log("$error");
                  ScaffoldMessenger.of(context).clearSnackBars();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$error"),
                    ),
                  );
                });
                await Future.delayed(const Duration(seconds: 1));
                setState(() {
                  isLoading = false;
                });
              },
              child: (!isLoading)
                  ? const Text(
                      "Add Data",
                      style: TextStyle(color: Colors.white),
                    )
                  : const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                  query: _firebasedb,
                  itemBuilder: (context, snapshot, animation, index) {
                    String title = snapshot.child("Name").value.toString();
                    String id = snapshot.child("id").value.toString();
                    if (searchController.text.isEmpty) {
                      return ListTile(
                        trailing: PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: () async {
                                    log(id);
                                    // updateController =
                                    //     title as TextEditingController;
                                    Navigator.pop(context);
                                    await showdailog(title, "Update", id);
                                    // Navigator.pop(context);
                                  },
                                  leading: const Icon(Icons.edit),
                                  title: const Text("Edit"),
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: () async {
                                    await showdailog(title, "Delete", id);
                                  },
                                  leading: const Icon(Icons.delete),
                                  title: const Text("Delete"),
                                ),
                              )
                            ];
                          },
                        ),
                        title: Text(title),
                        subtitle: Text(snapshot.child("id").value.toString()),
                      );
                    } else if (title
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      return ListTile(
                        title: Text(title),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController updateController = TextEditingController();
  String updateValue = "";
  Future<void> showdailog(String title1, String title, String id) {
    updateController.text = title1;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const BeveledRectangleBorder(),
            title: Text(title),
            content: TextFormField(
              controller: updateController,
              decoration: InputDecoration(
                hintText: "Enter The $title Vallue",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancel"),
              ),
              TextButton(
                onPressed: () async {
                  if (title == "Update") {
                    await _firebasedb.child(id).update({
                      "Name": updateController.text.toString(),
                    }).then((value) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Data $title Successfully"),
                        ),
                      );
                      updateController.clear();
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$error"),
                        ),
                      );
                    });
                  } else {
                    await _firebasedb.child(id).remove().then((value) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data Deleted Successfully"),
                        ),
                      );
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$error"),
                        ),
                      );
                    });
                  }

                  Navigator.pop(context);
                },
                child: Text(title),
              ),
            ],
          );
        });
  }
}
