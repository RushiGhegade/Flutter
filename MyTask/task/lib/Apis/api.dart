import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/packages/package.dart';

class Api {
  // Login the User
  static Future<http.Response> login(String name, String pass) async {
    Uri url = Uri.parse(
        "https://graceful-solace-production.up.railway.app/jwt/login");

    http.Response response = await http.post(
      url,
      body: jsonEncode({
        "username": name,
        "password": pass,
      }),
    );

    return response;
  }

  // Create a Account
  static Future<http.Response> createAccount(CreateAccount obj) async {
    Uri url = Uri.parse(
        "https://graceful-solace-production.up.railway.app/account/register");

    return await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "firstName": obj.firstName,
        "lastName": obj.lastName,
        "aadharCard": obj.aadharCard,
        "panCard": obj.panCard,
        "email": obj.email,
        "mobileNo": obj.mobileNo,
        "roles": "USER",
        "password": obj.password,
      }),
    );
  }
}
