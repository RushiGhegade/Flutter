import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dummyapp/Dailogs/snackBar.dart';
import 'package:dummyapp/Login/login_Screen.dart';
import 'package:dummyapp/Model/users.dart';
import 'package:dummyapp/View/chatScreen.dart';
import 'package:dummyapp/View/profileScreen.dart';
import 'package:dummyapp/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'login_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _firebaseauth = FirebaseAuth.instance;

  List<Users?> list = [];
  List<Users?> searchList = [];
  bool isSearching = false;

  void LogOut() async {
    try {
      await Apis.firebaseauth.signOut().then((value) {
        log("Sign out Successfully with Email");
      });
      await GoogleSignIn().signOut().then((value) {
        log("Sign out Successfully with google");
      });
      SnackBars(context, "Account Logout Successfully").showSnackBars();
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ));
    } catch (e) {
      log("$e");
    }
  }

  @override
  void initState() {
    Apis.getSelfInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              isSearching = !isSearching;
              searchList = list;
              setState(() {});
            },
            icon: (!isSearching)
                ? const Icon(
                    size: 31,
                    Icons.search,
                    color: Colors.black,
                  )
                : const Icon(
                    size: 31,
                    Icons.clear_rounded,
                    color: Colors.black,
                  ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProfileScreen(user: Apis.me);
                },
              ));
            },
            icon: const Icon(
              size: 31,
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
        leading: IconButton(
          onPressed: () async {
            LogOut();
            setState(() {});
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        automaticallyImplyLeading: false,
        title: (!isSearching)
            ? const Text("Chat App")
            : SizedBox(
                height: 40,
                child: TextFormField(
                  onChanged: (value) {
                    searchList.clear();
                    for (int i = 0; i < list.length; i++) {
                      if (list[i]!
                              .name
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                          list[i]!
                              .email
                              .toLowerCase()
                              .contains(value.toLowerCase())) {
                        searchList.add(list[i]!);
                      }
                    }
                    setState(() {});
                    log("$searchList");
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.black,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: StreamBuilder(
                  stream: Apis.fireStore.collection("Users").snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        final data = snapshot.data?.docs;
                        list = data
                                ?.map((e) => Users.fromJson(e.data()))
                                .toList() ??
                            [];
                    }
                    return (list.isNotEmpty)
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                (isSearching) ? searchList.length : list.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.white,
                                // elevation: ,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsetsDirectional.symmetric(
                                    vertical: 7, horizontal: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ChatScreen(
                                          user: list[index]!,
                                        );
                                      },
                                    ));
                                  },
                                  child: ListTile(
                                    title: Text((isSearching)
                                        ? searchList[index]!.name
                                        : list[index]!.name),
                                    subtitle: Text((isSearching)
                                        ? searchList[index]!.about
                                        : list[index]!.about),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        // image: DecorationImage(image: )
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(22),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          // height: 20,
                                          // width: 20,
                                          imageUrl: (isSearching)
                                              ? searchList[index]!.image
                                              : list[index]!.image,
                                          placeholder: (context, url) {
                                            // return const CircularProgressIndicator();
                                            return const Icon(
                                                // color: Colors.blue,
                                                size: 35,
                                                Icons.person_3_rounded);
                                          },
                                          errorWidget: (context, url, error) {
                                            return const Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                    ),
                                    trailing: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    // trailing: const Text(
                                    //   "28 july 2024",
                                    //   style: TextStyle(
                                    //     fontSize: 14,
                                    //   ),
                                    // ),
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                              "No Connection Found !",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
