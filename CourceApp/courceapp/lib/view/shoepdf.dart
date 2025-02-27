import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class ShowPDF extends StatefulWidget {
  String path;
  String name;
  ShowPDF({super.key, required this.path, required this.name});

  @override
  State<ShowPDF> createState() => _ShowPDFState();
}

class _ShowPDFState extends State<ShowPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: PDF(
        swipeHorizontal: false,
        pageFling: true,
      ).cachedFromUrl(widget.path),
      // body: PDF(
      //   enableSwipe: true,
      //   swipeHorizontal: false,
      //   autoSpacing: false,
      //   pageFling: true,
      //   backgroundColor: Colors.grey,
      //   onError: (error) {
      //     print(error.toString());
      //   },
      //   onPageError: (page, error) {
      //     print('$page: ${error.toString()}');
      //   },
      //   // onPageChanged: (int page, int total) {
      //   //   print('page change: $page/$total');
      //   // },
      // ).fromAsset(widget.path),
    );
  }
}
