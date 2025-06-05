import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appImage({String imagePath = "assets/icons/home.svg"}) {
  return SvgPicture.asset(imagePath, color: Colors.white);
}
