import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GetApiData {
  static Future<Map> categoryData(String category) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=28eea0e40b3b467390debf04160a8e58");
    http.Response response = await http.get(url);

    Map newsData = json.decode(response.body);

    Future.delayed(Duration(seconds: 1));
    // log("---------------$newsData");

    return newsData;
  }

  static Future<Map> homeData() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=28eea0e40b3b467390debf04160a8e58");
    http.Response response = await http.get(url);

    Map newsData = json.decode(response.body);

    Future.delayed(Duration(seconds: 1));

    return newsData;
  }

  static Future<Map> searchData(String search) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?q=$search&apiKey=28eea0e40b3b467390debf04160a8e58");
    http.Response response = await http.get(url);
    Map? newsData;
    if (response.statusCode == 200) {
      newsData = json.decode(response.body);
      log("$newsData");
    } else {
      log("data is empty");
      newsData = {};
    }

    Future.delayed(Duration(seconds: 1));

    return newsData!;
  }
}
