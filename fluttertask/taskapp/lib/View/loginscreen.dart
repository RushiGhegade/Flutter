import 'dart:convert';
import 'dart:developer';

import 'package:taskapp/Packages/packages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final userNamekey = GlobalKey<FormFieldState>();
  final passKey = GlobalKey<FormFieldState>();

  void loginWithUsernamePass() async {
    //Controllers
    String name = userNameController.text.trim().toString();
    String pass = passController.text.trim().toString();
    //Keys
    userNamekey.currentState!.validate();
    passKey.currentState!.validate();

    if (name.isNotEmpty && pass.isNotEmpty) {
      final response = await Api.login(name, pass);

      log("${response.body}");

      final list = jsonDecode(response.body);

      log("List --->$list");

      if (response.statusCode == 200) {
        Snacks.mySnackBar(context, "Login Sucessful", true);
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
        clearController();
      } else {
        if (list['message'] == 'Invalid Credientials') {
          Snacks.mySnackBar(context, "Wrong Password", false);
        } else {
          Snacks.mySnackBar(context, "User not found", false);
        }
      }
    }

    setState(() {});
  }

  void clearController() {
    userNameController.clear();
    passController.clear();
  }

  bool flag = true;
  bool tflag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Center(
                  child: Image.asset(
                    "lib/Images/image2 (1).jpg",
                    width: 280,
                  ),
                ),
                Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Spacer(),
                Text(
                  "Let's Get Started",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  "Enter the Email/Ughesername",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                TextFormField(
                  controller: userNameController,
                  key: userNamekey,
                  validator: (value) {
                    log("$value");
                    if (value!.isEmpty) {
                      return "Enter the Email";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the Email",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 116, 115, 115)),
                    contentPadding: const EdgeInsets.all(8),
                    prefixIcon: const Icon(
                      Icons.person_2,
                      color: Color.fromARGB(255, 13, 136, 236),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the Password",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                TextFormField(
                  controller: passController,
                  key: passKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the Password";
                    } else {
                      return null;
                    }
                  },
                  obscuringCharacter: "*",
                  obscureText: (flag) ? true : false,
                  decoration: InputDecoration(
                    hintText: "Enter the Password",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 116, 115, 115)),
                    contentPadding: const EdgeInsets.all(8),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 13, 136, 236),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        flag = !flag;
                        setState(() {});
                      },
                      child: Icon(
                        (flag) ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromARGB(255, 13, 136, 236),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                GestureDetector(
                  onTap: () async {
                    log("call in login ");
                    setState(() {
                      tflag = !tflag;
                    });
                    loginWithUsernamePass();
                    // Navigator.pushReplacement(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return const HomeScreen();
                    //   },
                    // ));
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      tflag = !tflag;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 13, 136, 236),
                    ),
                    height: 50,
                    child: (tflag)
                        ? Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 4,
                          ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
