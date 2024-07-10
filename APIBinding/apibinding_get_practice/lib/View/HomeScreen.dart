// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   var empData = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("API Binding"),
//           centerTitle: true,
//           backgroundColor: Colors.blue,
//         ),
//         body: (empData.length == 0)
//             ? Container()
//             : Column(
//                 children: [
//                   Text(empData['employee_name']),
//                 ],
//               ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: getData,
//           child: const Text("Add"),
//         ));
//   }

//   void getData() async {
//     Uri url = Uri.parse("https://dummy.restapiexample.com/api/v1/employee/1");

//     http.Response response = await http.get(url);

//     // log(response.body);

//     var responseData = json.decode(response.body);

//     log(responseData['status']);
//     empData = responseData['data'];

//     log("$empData");
//     setState(() {});
//   }
// }
