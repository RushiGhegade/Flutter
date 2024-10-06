import 'dart:async';
import 'dart:developer';
// import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummyapp/Model/message.dart';
import 'package:dummyapp/Model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class Apis {
// create a firebaseStorage instance
  static FirebaseStorage fbStorage = FirebaseStorage.instance;

  // create a instance for Authentication
  static FirebaseAuth firebaseauth = FirebaseAuth.instance;
  // create a instance for store data
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // it is for current userInfo
  static late Users me;

  // get the firebaseMessaging Request
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  // it give the firebase messaging Token it can give the permission from user
  static Future<void> getFirebaseMsgToken() async {
    NotificationSettings settings = await messaging.requestPermission();
    log('User granted permission: ${settings.authorizationStatus}');

    messaging.getToken().then((t) {
      if (t != null) {
        me.pushToken = t;
        log("Push Token : $t");
      }
    });
  }

  // update the Value in firebase Notification
  static Future<void> update() async {
    fireStore.collection("Users").doc(firebaseauth.currentUser!.uid).update({
      "push_token": me.pushToken,
    });
  }

  static Future<void> getSelfInfo() async {
    await fireStore
        .collection("Users")
        .doc(firebaseauth.currentUser!.uid)
        .get()
        .then((value) async {
      if (value.exists) {
        me = Users.fromJson(value.data()!);
        await getFirebaseMsgToken();
        await updateValues();
        log("Call Done Update");
      } else {
        await createUser().then((value) {
          return getSelfInfo();
        });
      }
    });
  }

  // Create a funtion to update the values
  static Future<void> updateValues() async {
    log("Funtion call Suucessfully");
    log("${me.name}");
    log("${me.about}");
    await fireStore
        .collection("Users")
        .doc(firebaseauth.currentUser!.uid)
        .update({
      "name": me.name,
      "about": me.about,
      "push_token": me.pushToken,
    });
  }

  // check the login user is exit or not
  static Future<bool> userExits() async {
    return (await fireStore
            .collection("Users")
            .doc(firebaseauth.currentUser!.uid)
            .get())
        .exists;
  }

  // get user messages
  static Stream<QuerySnapshot<Map<String, dynamic>>> getalluser() {
    return fireStore.collection("message").snapshots();
  }

  // when user login then it create a user in firestore
  static Future<void> createUser() async {
    final date = DateTime.now().microsecondsSinceEpoch.toString();
    final user = Users(
      image: firebaseauth.currentUser!.photoURL.toString(),
      isActive: false,
      name: firebaseauth.currentUser!.displayName.toString(),
      about: "Hey, I'am Using Chat App",
      createdAt: date,
      id: firebaseauth.currentUser!.uid.toString(),
      lastActive: date,
      pushToken: '',
      email: firebaseauth.currentUser!.email.toString(),
    );

    return await fireStore
        .collection("Users")
        .doc(firebaseauth.currentUser!.uid)
        .set(user.toJson());
  }

  //this function getting Convesion id
  static String getConversionId(String id) {
    if (FirebaseAuth.instance.currentUser!.uid.hashCode <= id.hashCode) {
      return '${FirebaseAuth.instance.currentUser!.uid}_$id';
    } else {
      return '${id}_${FirebaseAuth.instance.currentUser!.uid}';
    }
  }

  // for reciving message from user
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessage(Users user) {
    return fireStore
        .collection('Chats/${getConversionId(user.id)}/messages/')
        .snapshots();
  }

  // for sending Message
  static Future<void> sendMessage(Users user, String message) async {
    // it id for sending message
    final time = DateTime.now();

    final Message msg = Message(
        msg: message,
        read: '',
        told: user.id,
        type: "Text",
        // sent: "${time.hour}:${time.second}",
        sent: DateFormat.jm().format(DateTime.now()),
        fromid: firebaseauth.currentUser!.uid);

    final ref =
        fireStore.collection('Chats/${getConversionId(user.id)}/messages/');

    return ref.doc().set(msg.toJson());
  }

  // Upadte profile picture
  static Future<void> updateProfile(File file) async {
    // take a extention of the image like png,jpg etc

    final ext = file.path.split(".").last;
    log("Extention :${ext}");

    final ref = fbStorage
        .ref()
        .child("ProfilePic/${firebaseauth.currentUser!.uid}.$ext");

    ref.putFile(file, SettableMetadata(contentType: "image/$ext")).then((p0) {
      log("Data Transfer: ${p0.bytesTransferred / 1000} kb");
    });
    me.image = await ref.getDownloadURL();
    await fireStore
        .collection("Users")
        .doc(firebaseauth.currentUser!.uid)
        .update({
      "image": me.image,
    });
  }
}
