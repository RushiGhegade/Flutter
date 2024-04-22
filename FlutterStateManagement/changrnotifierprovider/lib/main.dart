// provider
import 'package:changrnotifierprovider/ComanyInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Company(comName: "Google", empCount: 250);
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CompanyInfo(),
      ),
    );
  }
}

class Company extends ChangeNotifier {
  String comName;
  int empCount;

  Company({required this.comName, required this.empCount});

  void changedata(String comName) {
    this.comName = comName;
    notifyListeners();
  }
}



































// import 'package:changrnotifierprovider/ComanyInfo.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import '';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) {
//         return Company(companyName: "Goggle", empCount: 250);
//       },
//       child: const MaterialApp(
//         home: CompanyInfo(),
//       ),
//     );
//   }
// }

// class Company with ChangeNotifier {
//   String companyName;
//   int empCount;
//   Company({required this.companyName, required this.empCount});

//   void updatevalue(String companyName, int empCount) {
//     this.companyName = companyName;
//     this.empCount = empCount;
//     notifyListeners();
//   }
// }
