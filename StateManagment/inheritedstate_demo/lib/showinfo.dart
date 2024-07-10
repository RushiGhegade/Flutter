import 'package:flutter/material.dart';
import 'package:inheritedstate_demo/Myinfo.dart';
import 'package:inheritedstate_demo/main.dart';

class ShowInfo extends StatefulWidget {
  ShowInfo({super.key});

  @override
  State createState() {
    return _showInfoState();
  }
}

class ModelClass {
  String id;
  String name;
  String username;

  ModelClass({required this.id, required this.name, required this.username});
}

TextEditingController idController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class _showInfoState extends State {
  @override
  Widget build(BuildContext context) {
    MyApp obj = MyApp.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          TextFormField(
            controller: idController,
            decoration: InputDecoration(
              hintText: "Id",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                ModelClass obj1 = ModelClass(
                  id: idController.text,
                  name: nameController.text,
                  username: usernameController.text,
                );

                obj.id = obj1.id;
                obj.name = obj1.name;
                obj.username = obj1.username;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyInfo(),
                  ),
                );
              },
              child: const Text('Submit'))
        ]),
      ),
    );
  }
}
