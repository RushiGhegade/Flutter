import 'dart:convert';
import 'dart:developer';

import 'package:apibinding_with_modelclass/ModelClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> empdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aping Binding"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: empdata.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(empdata[index].empName!),
                const Spacer(),
                Text("${empdata[index].empSal}"),
                const SizedBox(
                  width: 50,
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        child: const Text("Add"),
      ),
    );
  }

  void getData() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");

    http.Response response = await http.get(url);

    var responseData = json.decode(response.body);

    ModelClass obj = ModelClass(responseData);

    empdata = obj.data!;

    log("Sucessfull get  data");
    log("$empdata");

    setState(() {});
  }
}
