// Create a screen and display a Listview having a count of 10.
// The child of the Listview must be a container which must display a title and a
// description on top of each other and next to them display an Icon in a circular
// container.

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 20, top: 10),
              // width: 310,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Title 1"),
                      Text("Give Some Discription Here.")
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 61,
                    width: 61,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
