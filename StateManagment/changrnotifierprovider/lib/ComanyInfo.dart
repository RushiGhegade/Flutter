import 'package:changrnotifierprovider/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({super.key});

  @override
  State createState() {
    return _CompanyInfoState();
  }
}

class _CompanyInfoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Provider.of<Company>(context, listen: false).changedata("Meta");
              },
              child: Text(Provider.of<Company>(context).comName),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("${Provider.of<Company>(context).empCount}"),
            Text("hello")
          ],
        ),
      ),
    );
  }
}


















// import 'package:changrnotifierprovider/main.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CompanyInfo extends StatefulWidget {
//   const CompanyInfo({super.key});

//   @override
//   State createState() {
//     return _CompanyInfoState();
//   }
// }

// class _CompanyInfoState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(Provider.of<Company>(context).companyName),
//             const SizedBox(
//               height: 30,
//             ),
//             Text("${Provider.of<Company>(context).empCount}"),
//             const SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   // setState(() {
//                   //   Provider.of<Company>(context, listen: false).companyName =
//                   //       "Meta";
//                   // });
//                   Provider.of<Company>(context, listen: false).updatevalue(
//                       "meta",
//                       Provider.of<Company>(context, listen: false).empCount);
//                 },
//                 child: const Text("Click"))
//           ],
//         ),
//       ),
//     );
//   }
// }
