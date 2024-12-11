import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, ToastGravity gravity) {
  try {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 13
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}