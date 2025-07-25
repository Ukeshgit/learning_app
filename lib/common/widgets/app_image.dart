import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appImage({
  String imagePath = "assets/icons/user.png",
  int h = 17,
  int w = 16,
}) {
  return Image.asset(imagePath, height: h.h, width: w.h);
}
