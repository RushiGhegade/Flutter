import 'dart:convert';
import 'dart:developer';

import 'package:apibinding_with_modelclass_for1employee/ModelClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ModelClass> empdata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: (empdata.isNotEmpty)
          ? Row(
              children: [
                Text(empdata[0].empName!),
                Text("${empdata[0].empSal}"),
              ],
            )
          : const Text("Empty"),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        child: const Text("Add"),
      ),
    );
  }

  void getData() async {
    // Uri url = Uri.parse("	https://dummy.restapiexample.com/api/v1/employee/1");

    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employee/1");

    http.Response response = await http.get(url);

    var responseData = json.decode(response.body);

    ModelClass obj = ModelClass(responseData['data']);

    empdata.add(obj);

    log("Data Add SuccessFully");
    setState(() {});
  }
}
