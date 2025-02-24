import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showWeatherToast(bool isWeatherGood) {
  String message =
      isWeatherGood
          ? "🌤️ The weather is good! You can go out and enjoy your time."
          : "☔ The weather is not suitable for going out. Better stay indoors!";

  Color bgColor = isWeatherGood ? Colors.green : Colors.red;

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: bgColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
