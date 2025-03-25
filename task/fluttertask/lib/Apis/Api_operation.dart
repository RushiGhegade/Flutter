import 'dart:convert';
import 'dart:developer';

import 'package:fluttertask/model/ModelClass.dart';
import 'package:http/http.dart' as http;

class ApiOperation {
  static Future<List<Modelclass>> getData(String search) async {
    try {
      String uri = "https://www.omdbapi.com/?s=$search&apikey=aadd5199";

      Uri url = Uri.parse(uri);

      final reponse = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      // log("${reponse.body}");

      final data = json.decode(reponse.body);

      List<Modelclass> list = [];

      for (int i = 0; i < data['Search'].length; i++) {
        list.add(Modelclass(
            title: data['Search'][i]['Title'],
            year: data['Search'][i]['Year'],
            imdbid: data['Search'][i]['imdbID'],
            type: data['Search'][i]['Type'],
            poster: data['Search'][i]['Poster']));
      }
      // log("$list");
      return list;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
