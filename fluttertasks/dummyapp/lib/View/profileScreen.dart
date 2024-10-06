import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dummyapp/Dailogs/snackBar.dart';
import 'package:dummyapp/Login/login_Screen.dart';
import 'package:dummyapp/Model/users.dart';
import 'package:dummyapp/View/HomeScreen.dart';
import 'package:dummyapp/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  final Users user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController =
      TextEditingController(text: Apis.me.name);
  final TextEditingController aboutController =
      TextEditingController(text: Apis.me.about);

  String? image;

  void ShowMyDailog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                "Pick Profile Photo",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      // Pick an image.
                      final XFile? _image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (_image != null) {
                        log(_image.path);
                        image = _image.path;
                        Navigator.pop(context);
                        Apis.updateProfile(File(image!));
                      }
                      setState(() {});
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          border: Border(),
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "lib/images/gallery.png",
                            ),
                          )),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      // Pick an image.

                      final XFile? _image =
                          await picker.pickImage(source: ImageSource.camera);
                      if (_image != null) {
                        log(_image.path);
                        image = _image.path;
                        Apis.updateProfile(File(image!));
                        Navigator.pop(context);
                      }
                      setState(() {});
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "lib/images/camera.png",
                            ),
                          )),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    log("${widget.user?.image}");
    log("${widget.user.name}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ));
          },
          child: const Icon(
            Icons.arrow_back,
            size: 29,
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        (image != null)
                            ? Container(
                                height: 150,
                                width: 150,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,

                                  // image: DecorationImage(image: )
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.file(
                                    fit: BoxFit.cover,
                                    // height: 20,
                                    // width: 20,
                                    File(image!),
                                  ),
                                ),
                              )
                            : Container(
                                height: 150,
                                width: 150,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // image: DecorationImage(image: )
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.contain,
                                    // height: 20,
                                    // width: 20,
                                    imageUrl: widget.user.image,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 95, left: 78),
                          child: MaterialButton(
                            shape: const CircleBorder(),
                            color: Colors.white,
                            onPressed: () {
                              ShowMyDailog();
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.user.email,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Name"),
              SizedBox(
                height: 50,
                // widt,
                child: TextFormField(
                  controller: nameController,
                  // scrollPadding: EdgeInsets.all(20),
                  // onSaved: (newValue) {
                  //   log("---------------------------------------");
                  //   Apis.me.name = newValue ?? "";
                  // },
                  // onEditingComplete: () {
                  //   log("---------------------------------");
                  //   Apis.me.name = nameController.text.toString();
                  // },
                  // initialValue: widget.user.name,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    // prefix: const Icon(Icons.person),
                    prefixIcon: const Icon(
                      Icons.person_3,
                      color: Colors.blue,
                      size: 26,
                    ),
                    hintText: "Rushikesh Ghegade",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("About"),
              SizedBox(
                height: 50,
                // widt,
                child: TextFormField(
                  controller: aboutController,
                  // onSaved: (newValue) async {
                  //   Apis.me.about = newValue ?? "";
                  // },
                  // onEditingComplete: () {
                  //   Apis.me.about = aboutController.text.toString();
                  // },
                  // initialValue: widget.user.about,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                      size: 26,
                    ),
                    hintText: "Felling Happy",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    )),
                onPressed: () async {
                  // onEditingComplete: () {
                  log("----------------------------------------------------");
                  Apis.me.name = nameController.text.toString();
                  Apis.me.about = aboutController.text.toString();
                  log("----------------------------------------------------");
                  // },
                  await Apis.updateValues();
                  setState(() {});
                },
                child: const Text(
                  "Upadte",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        onPressed: () {
          LogOut();
          setState(() {});
        },
        label: const Row(
          children: [
            Icon(color: Colors.white, Icons.logout),
            SizedBox(
              width: 10,
            ),
            Text(
              "Log out",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

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
}
