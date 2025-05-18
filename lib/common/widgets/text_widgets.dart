import 'package:flutter/material.dart';

Widget text24Normal({String? text}) {
  return Text(
    text ?? "",
    style: TextStyle(
      color: Colors.blue,
      fontSize: 25,
      fontWeight: FontWeight.normal,
    ),
  );
}
