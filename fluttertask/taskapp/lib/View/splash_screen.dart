import 'package:taskapp/Packages/packages.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Provider.of<news>(context).events = Api.news();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/Images/image5 (1).jpg"),
          Text(
            "Welcome",
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
