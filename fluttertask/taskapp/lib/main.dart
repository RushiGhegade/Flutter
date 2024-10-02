import 'package:taskapp/Packages/packages.dart';

import 'modelclass/newsmodelclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return news();
        },
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}

class news extends ChangeNotifier {
  Future<List<Event>> events = Api.news();
  Set<Event> set = {};
  Set<Event> save = {};
}
