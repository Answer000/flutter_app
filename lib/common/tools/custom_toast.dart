import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension CustomToast on Fluttertoast {

  static show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15,
    );
  }
}