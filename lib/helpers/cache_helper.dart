import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class CacheHelper{
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static getData({required String name,type}){
    return prefs.getString(name)??"";
  }

  static getLang(){
    String lang=prefs.getString("lang")??"";
    return lang.isEmpty?window.locale.languageCode:lang;

  }

  static removeData(){
    prefs.clear();
  }

  static saveUserData({required Map data,required String token})async{
    prefs.setInt("id", data['id']);
    prefs.setString("name", data['name']);
    prefs.setString("email",data['email']);
    prefs.setString("token",token);
  }

  static getUserData(){
    int? id=prefs.getInt("id");
    String? name=prefs.getString("name");
    String? email=prefs.getString("email");
    String? token=prefs.getString("token");
    return UserModel(id:id,name:name, email: email??"", token: token);
  }

}