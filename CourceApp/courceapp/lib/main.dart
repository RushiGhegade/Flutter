import 'package:courceapp/firebaseOperations/firebaseoperation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ModelClasses/corcedatamodelclass.dart';
import 'view/splash_screen.dart';

List<CourceDataModel> list = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCPNQXyds844MifnWn3u5SFK9L2vqw_QAA",
        appId: "1:550478642155:android:90d67a9fd146845b31b7ae",
        messagingSenderId: "550478642155",
        projectId: "geometric-vim-422815-b5"),
  );
  LectureData(lectureData: [], selectCource: null).getdataFromFirebase();
  // FirebaseOperation.getData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LectureData(lectureData: list, selectCource: null);
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class LectureData extends ChangeNotifier {
  List<CourceDataModel>? lectureData;
  CourceDataModel? selectCource;

  LectureData({required this.lectureData, required this.selectCource});

  void getdataFromFirebase() async {
    list.clear();
    list = await FirebaseOperation.getData();
    notifyListeners();
  }
}
