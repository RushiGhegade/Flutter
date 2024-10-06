import 'package:dummyapp/Model/message.dart';
import 'package:dummyapp/apis/apis.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.msg});

  final Message msg;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Apis.firebaseauth.currentUser!.uid == widget.msg.fromid
        ? sendMessage()
        : receiveMsg();
  }

  Widget sendMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding:
                const EdgeInsets.only(left: 10, right: 17, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                border: Border.all(color: Colors.black38),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Column(
              children: [
                Text(
                  "${widget.msg.msg}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 17),
          child: Row(
            children: [
              Text(
                "${widget.msg.sent}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.done_all_rounded,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget receiveMsg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Text(
            "${widget.msg.sent}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding:
                const EdgeInsets.only(left: 10, right: 17, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                border: Border.all(color: Colors.black38),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              children: [
                Text(
                  "${widget.msg.msg}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Spacer(),
      ],
    );
  }
}
