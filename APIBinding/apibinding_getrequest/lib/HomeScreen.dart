import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  List<dynamic> empdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
      ),
      body: ListView.builder(
        itemCount: empdata.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              // Image.network(empdata[index]['profile_image']),

              const SizedBox(
                width: 20,
              ),
              Text(empdata[index]['employee_name']),
              // const SizedBox(
              //   width: 50,
              // ),
              const Spacer(),
              Text("${empdata[index]['employee_salary']}"),
              const SizedBox(
                width: 90,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getdata,
        child: const Text("Add"),
      ),
    );
  }

  void getdata() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employees");

    http.Response response = await http.get(url);

    // log(response.body);
    var responseData = json.decode(response.body);
    // final body = json.decode(response.body);
    log("${responseData['data']}");
    empdata = responseData['data'];
    setState(() {});
  }
}
