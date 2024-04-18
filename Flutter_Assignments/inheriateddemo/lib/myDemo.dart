import 'package:flutter/material.dart';
import 'package:inheriateddemo/main.dart';
import 'package:inheriateddemo/newscreen.dart';

class ShowInfoScreen extends StatefulWidget {
  const ShowInfoScreen({super.key});

  @override
  State createState() {
    return _ShowInfoScreenState();
  }
}

TextEditingController namecontroller = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController teamController = TextEditingController();

class _ShowInfoScreenState extends State {
  @override
  Widget build(BuildContext context) {
    PlayerInfo obj = PlayerInfo.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                  hintText: "Enter Player Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(
                  hintText: "Enter Player City",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: teamController,
              decoration: InputDecoration(
                  hintText: "Enter Player Team",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                obj.name = namecontroller.text;
                obj.city = cityController.text;
                obj.team = teamController.text;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShowInfoPlayer(),
                  ),
                );
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
