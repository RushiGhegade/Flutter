import 'dart:developer';

import 'package:consumerdemo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State {
  @override
  Widget build(BuildContext context) {
    log("in myPage Build");
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text(Provider.of<Employee>(context).empName),
          const SizedBox(
            height: 20,
          ),
          Text("${Provider.of<Employee>(context).empId}"),
          const SizedBox(
            height: 20,
          ),

          Consumer2<Employee, Company>(
              builder: (context, value, value1, child) {
            return Column(
              children: [
                Text(value.empName),
                const SizedBox(
                  height: 20,
                ),
                Text("${value.empId}"),
                const SizedBox(
                  height: 20,
                ),
                Text(value1.proName)
              ],
            );
          }),

          // Consumer<Employee>(
          //   builder: (context, Employee, child) {
          //     log("value=$Employee");
          //     return Column(
          //       children: [
          //         Text(Employee.empName),
          //         const SizedBox(
          //           height: 30,
          //         ),
          //         Text("${Provider.of<Company>(context).salary}"),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //       ],
          //     );
          //   },
          // ),

          // Consumer(builder: (context, value, child) {
          //   log("In Consumer ");
          //   return Column(
          //     children: [
          //       Text(Provider.of<Employee>(context).empName),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Text("${Provider.of<Company>(context).salary}"),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //     ],
          //   );
          // }),
          ElevatedButton(
              onPressed: () {
                Provider.of<Company>(context, listen: false)
                    .changedata("Web Dev", 350000);
                Provider.of<Employee>(context, listen: false)
                    .changedata1("Ashish", 12222);
              },
              child: const Text("Change data")),
          const SizedBox(
            height: 20,
          ),
          // const Normal(),
        ],
      ),
    ));
  }
}

class Normal extends StatelessWidget {
  const Normal({super.key});
  @override
  Widget build(BuildContext context) {
    log("In Normal App Build");
    return Text(Provider.of<Company>(context).proName);
  }
}
