// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Cashhelper {
  setuserid(id) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("id", id);
  }

  setlanguage(lang) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("lang", lang);
  }

  setlocation(location) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("location", location);
  }

  setuserlogin(login) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("login", login);
  }

  setuserinfo(info) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("userinfo", jsonEncode(info));
  }

  setuserlocalization(local) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("local", local);
  }

  Future<String?> getuserid() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString("id");
  }

  Future<String?> getlocation() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString("location");
  }

  Future<String?> getlanguage() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString("lang");
  }

  Future<Map<String, dynamic>> getuserinfo() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();

    return jsonDecode(sharedPreferences.getString("userinfo")!);
  }

  Future<bool?> getuserlogin() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();

    return sharedPreferences.getBool("login");
  }
}
