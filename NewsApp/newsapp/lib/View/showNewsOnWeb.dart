import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowNewsOnWeb extends StatefulWidget {
  int index = 0;
  String url;
  ShowNewsOnWeb({super.key, required this.index, required this.url});

  @override
  State<ShowNewsOnWeb> createState() => _ShowNewsOnWebState();
}

class _ShowNewsOnWebState extends State<ShowNewsOnWeb> {
  late final WebViewController controller;

  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(onPageStarted: (url) {
          log("On Page Started");
          setState(() {
            isloading = true;
          });
        }, onPageFinished: (url) {
          isloading = false;
          log("On Page Finished");
        }, onWebResourceError: (url) {
          isloading = false;
          log("Error on Web");
        }),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notification_important_rounded),
          SizedBox(
            width: 10,
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1.0),
          )),
        ),
        // backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        title: Text("World News"),
      ),
      body: (!isloading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(controller: controller),
    );
  }
}
