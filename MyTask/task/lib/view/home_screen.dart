import 'package:task/packages/package.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ));
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 37,
                )),
            const Spacer(),
            Center(
              child: Text(
                "Hii !",
                style: GoogleFonts.poppins(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
