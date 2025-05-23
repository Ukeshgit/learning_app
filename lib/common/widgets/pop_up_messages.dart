import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage({String msg = ""}) {
  return Fluttertoast.showToast(
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16.0,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.green,
    msg: msg,
  );
}
