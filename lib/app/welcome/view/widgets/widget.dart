import 'package:flutter/material.dart';
import 'package:learner/common/widgets/app_shadow.dart';
import 'package:learner/common/widgets/text_widgets.dart';

Widget appOnBoardingPage({
  required String title,
  required String imagepath,
  required String subtitle,
}) {
  return Column(
    children: [
      Image.asset(imagepath, fit: BoxFit.cover),
      Container(
        margin: EdgeInsets.only(top: 10, left: 16, right: 16),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: text16Normal(text: subtitle),
      ),
      _nextbutton(),
    ],
  );
}

Widget _nextbutton() {
  return GestureDetector(
    onTap: () {
      print("Tapped");
    },
    child: Container(
      margin: EdgeInsets.only(top: 50),
      height: 50,
      width: 325,

      decoration: appBoxShadow(),
      child: Center(child: text16Normal(text: "Next", color: Colors.white)),
    ),
  );
}
