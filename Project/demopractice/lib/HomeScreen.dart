import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final controller =

  @override
  Widget build(BuildContext context) {
    // int value = Provider.of<ChangeValue>(context).value!;

    ValueChnageGetX controller = Get.put(ValueChnageGetX());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text("${controller.value.value}");
            }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Provider.of<ChangeValue>(context, listen: false)
                //     .changeValue(++v
                // alue);
                int value = controller.value.value;
                controller.changeValue(++value);
              },
              child: Text("Add"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Provider.of<ChangeValue>(context, listen: false)
                //     .changeValue(--value);
              },
              child: Text("sub"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Provider.of<ChangeValue>(context, listen: false).changeValue(0);
              },
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
