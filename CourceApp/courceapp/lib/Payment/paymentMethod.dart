import 'dart:developer';

import 'package:courceapp/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../firebaseOperations/firebaseoperation.dart';
import '../main.dart';

class Paymentmethod extends StatefulWidget {
  Paymentmethod(
      {super.key,
      required this.name,
      required this.val,
      required this.courceName});
  String? name;
  int? val;
  String? courceName;

  @override
  State<Paymentmethod> createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  late Razorpay _razorpay;
  TextEditingController amountController = TextEditingController();

  void openCheckOut(amount) async {
    amount = amount * 100;
    var options = {
      "key": "rzp_test_WlE3t1HvgIp74p",
      "amount": amount,
      "name": "Rushikesh Ghegade",
      "prefil": {"contact": 1234567890, "email": "ghegaderushikesh@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    flag = false;
    setState(() {});

    Fluttertoast.showToast(
        msg: "Payment Succesful!" + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    addCource(widget.name!, widget.val!);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail!" + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet" + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  bool flag = true;
  void addCource(String name, int val) async {
    await FirebaseOperation.addUser(name, val).then((onValue) {
      LectureData(lectureData: [], selectCource: null).getdataFromFirebase();
      ;
      Future.delayed(
          Duration(seconds: 5),
          () => {
                Provider.of<LectureData>(context, listen: false).lectureData =
                    list,
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ))
              });
    });

    log("Cource Get Sucessfully");
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          "Pay",
          style: TextStyle(
              color: Colors.white, fontSize: 31, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
      body: (flag)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cource Details",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Cource Name : ${widget.courceName}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Ammount : 4000",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Validity : 9 Month",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // int amount = int.parse(amountController.text.toString());

                      openCheckOut(4000);
                      // amountController.clear();
                    });
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    height: 60,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(1)),
                    child: Text(
                      "Proceed To Pay",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Adding A Cource . . .",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 29,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator()
                ],
              ),
            ),
    );
  }
}
