import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreDB {
  static Future<bool> storeData(String email, String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool setemail = await sharedPreferences.setString('email', email);
    bool setpass = await sharedPreferences.setString('pass', pass);

    return setemail && setpass;
  }

  static void getStoreData(String email, String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String email = sharedPreferences.getString('email') ?? "Not Login";
    String pass = sharedPreferences.getString('pass') ?? "Not Login";

    
  }
}
