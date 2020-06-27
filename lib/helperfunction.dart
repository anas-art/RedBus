import 'package:shared_preferences/shared_preferences.dart';

class Helperfunction{

  static String sharedpreferncesUserNamedKey = "USERNAMEKEY";
  static String sharedpreferncesUserEmailinKey = "USEREMAILKEY";

  ///SAVING DATA TO SHARED PREFERNCES

  static Future<bool> saveUserNameShredPrefernces(String username)
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedpreferncesUserNamedKey,username);
  }

  static Future<bool> saveUserEmailShredPrefernces(String useremail)
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedpreferncesUserEmailinKey,useremail);
  }

  ///getting data from sharedprefernces


  static Future<String> getUserNameShredPrefernces()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString(sharedpreferncesUserNamedKey);
  }
  static Future<String> getUserEmaileShredPrefernces()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString(sharedpreferncesUserEmailinKey);
  }

}