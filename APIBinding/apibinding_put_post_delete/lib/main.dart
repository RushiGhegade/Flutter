import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 30), backgroundColor: Colors.yellow),
            onPressed: () {
              //------------------------------------------
              // insert the data into server
              // postData();
              //-------------------------------------------
              // update the data into server
              // putData();
              //-------------------------------------------
              // deleted data server
              deleteData();
            },
            child: const Text("Click"),
          ),
        ),
      ),
    );
  }

  void postData() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/create");

    Map<String, String> info = {"name": "Rushi", "salary": "50k", "age": "21"};

    http.Response response = await http.post(url, body: info);

    log(response.body);
    //[log] {"status":"success","data":{"name":"Rushi","salary":"50k","age":"21","id":2740},"message":"Successfully! Record has been added."}
  }

  void putData() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/update/21");

    Map<String, String> info = {"name": "Ashish", "salary": "60k", "age": "21"};

    http.Response response = await http.put(url, body: info);

    log(response.body);
    //log] {"status":"success","data":{"name":"Ashish","salary":"60k","age":"21"},"message":"Successfully! Record has been updated."}
  }

  void deleteData() async {
    Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/delete/3");

    http.Response response = await http.delete(url);

    log(response.body);
    //[log] {"status":"success","data":"2","message":"Successfully! Record has been deleted"}
  }
}
