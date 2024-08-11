import 'dart:convert';
import 'dart:developer';

import 'package:task/packages/package.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController panCardController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final validationkey = GlobalKey<FormState>();

  void createAccount() async {
    //Controllers
    String firstName = firstNameController.text.toString();
    String lastName = lastNameController.text.toString();
    String adhar = adharController.text.toString();
    String panCard = panCardController.text.toString();
    String email = emailController.text.toString();
    String mobile = mobileController.text.toString();
    String password = passwordController.text.toString();
    //Keys
    bool res = validationkey.currentState!.validate();
    log("$res");

    if (res) {
      CreateAccount obj = CreateAccount(
        firstName: firstName,
        lastName: lastName,
        email: email,
        mobileNo: mobile,
        aadharCard: adhar,
        panCard: panCard,
        password: password,
      );

      final response = await Api.createAccount(obj);
      final list = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Design.MySnackBar(context, "Account Created Successfully", true);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ));
      } else {
        Design.MySnackBar(context, "${list['message']}", false);
      }
    }
  }

  bool flag = true;
  bool tflag = true;
  bool cflag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Image.asset(
                //     "lib/images/image3.jpg",
                //     width: 100,
                //   ),
                // ),
                const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Create New Account",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Form(
                    key: validationkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter the FirstName",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: firstNameController,
                          validator: (value) {
                            log("$value");
                            if (value!.isEmpty) {
                              return "Enter the FirstName";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter the FirstName",
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
                          "Enter the LastName",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: lastNameController,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the LastName";
                            } else {
                              return null;
                            }
                          },
                          obscuringCharacter: "*",
                          // obscureText: (flag) ? true : false,
                          decoration: InputDecoration(
                            hintText: "Enter the LastName",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 116, 115, 115)),
                            contentPadding: const EdgeInsets.all(8),
                            prefixIcon: const Icon(
                              Icons.person,
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
                          "Enter the AdharCard No",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: adharController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            log("$value");
                            if (value!.isEmpty) {
                              return "Enter the AdharCard No";
                            } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                              return "Enter Numbers only";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter the AdharCard No",
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
                          "Enter the Pancard No",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: panCardController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            log("$value");
                            if (value!.isEmpty) {
                              return "Enter the Pancard No";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter the Pancard No",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 116, 115, 115)),
                            contentPadding: const EdgeInsets.all(8),
                            prefixIcon: const Icon(
                              Icons.format_list_numbered_sharp,
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
                          "Enter the Email",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            log("$value");
                            if (value!.isEmpty) {
                              return "Enter the Email";
                            } else if (!value.contains("@gmail.com")) {
                              return "Email should Contain @gmail.com";
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
                              Icons.email,
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
                          "Enter the Phone No",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            log("$value");
                            if (value!.isEmpty) {
                              return "Enter the Phone No";
                            } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                              return "Phone Number Only Contains Digit";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter the Phone No",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 116, 115, 115)),
                            contentPadding: const EdgeInsets.all(8),
                            prefixIcon: const Icon(
                              Icons.call,
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
                          controller: passwordController,
                          // key: conPassKey,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the Password";
                            } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]')
                                .hasMatch(value)) {
                              return "password should Contains special Character [!@#\%^&*(),.?:{}|<>]";
                            } else {
                              return null;
                            }
                          },
                          obscuringCharacter: "*",
                          obscureText: (cflag) ? true : false,
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
                                cflag = !cflag;
                                setState(() {});
                              },
                              child: Icon(
                                (cflag)
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromARGB(255, 13, 136, 236),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    )),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      tflag = !tflag;
                    });
                    createAccount();
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
                            "Create Account",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
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
                      "Already Have An Account ? ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ));
                      },
                      child: const Text(
                        "Sign in ",
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
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
