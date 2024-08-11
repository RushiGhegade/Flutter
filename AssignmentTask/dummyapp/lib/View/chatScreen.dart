import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dummyapp/Model/users.dart';
import 'package:dummyapp/View/HomeScreen.dart';
import 'package:dummyapp/apis/apis.dart';
import 'package:flutter/material.dart';

import '../Model/message.dart';
import 'messages_creen.dart';

class ChatScreen extends StatefulWidget {
  final Users user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> list = [];

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 33, 149, 243),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 31,
            )),
        flexibleSpace: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // image: DecorationImage(image: )
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
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
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.name,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Last seen not available",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: Apis.getAllMessage(widget.user),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data!.docs;
                    list.clear();
                    log("After : $list");
                    list =
                        data?.map((e) => Message.fromJson(e.data())).toList() ??
                            [];
                    log("before : $list");
                }

                if (list.isNotEmpty) {
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      log("${list[index]}");
                      return MessageScreen(
                        msg: list[index],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Say Hii 👋",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          _showTyping(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _showTyping() {
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            shadowColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.emoji_emotions,
                  size: 28,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 19,
                ),
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the Message"),
                  ),
                ),
                const SizedBox(
                  width: 19,
                ),
                const Icon(
                  Icons.image,
                  size: 28,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.camera_alt,
                  size: 28,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        MaterialButton(
          height: 45,
          minWidth: 0,
          shape: const CircleBorder(),
          color: Colors.green,
          onPressed: () {
            log("${messageController.text.toString()}");
            if (messageController.toString().isNotEmpty) {
              Apis.sendMessage(widget.user, messageController.text.toString());
              messageController.clear();
            }
          },
          child: const Icon(Icons.send),
        )
      ],
    );
  }
}
