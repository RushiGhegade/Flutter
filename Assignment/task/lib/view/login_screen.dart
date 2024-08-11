import 'dart:convert';
import 'dart:developer';

import 'package:task/packages/package.dart';

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
        Design.MySnackBar(context, "Login Sucessful", true);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
        clearController();
      } else {
        if (list['message'] == 'Invalid username or password!') {
          Design.MySnackBar(context, "${list['message']}", false);
        } else {
          Design.MySnackBar(context, "InValid Password", false);
        }
      }
    }

    // setState(() {});
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
                Center(
                  child: Image.asset(
                    "lib/images/image2.jpg",
                    width: 280,
                  ),
                ),
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Spacer(),
                const Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Enter the Email/Ughesername",
                  style: TextStyle(
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
                const Text(
                  "Enter the Password",
                  style: TextStyle(
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
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      tflag = !tflag;
                    });
                    loginWithUsernamePass();
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
                        ? const Text(
                            "Login",
                            style: TextStyle(
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
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have An Account ? ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ));
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 13, 136, 236),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
