import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';






class Preferences {



  static Future<void> saveUserDetails(String token, String userId) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setString("token", token);
    await instance.setString("userId", userId);
    log("token saved!");
  }




  static Future<Map?> fetchUserDetails() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    String? token = instance.getString("token");
    String? userId = instance.getString("userId");
    return {
        "token":token,
        "userId":userId
       };
  }




  static Future<void> clear() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.clear();
  }




}