import 'package:flutter/material.dart';

import 'package:learner/common/widgets/app_shadow.dart';
import 'package:learner/common/widgets/text_widgets.dart';

Widget appOnBoardingPage(
  PageController controller, {
  required String title,
  required String imagepath,
  required String subtitle,
  double index = 0,
  required BuildContext context,
}) {
  return Column(
    children: [
      Image.asset(imagepath, fit: BoxFit.cover, height: 350),
      Container(
        margin: EdgeInsets.only(top: 10, left: 16, right: 16),
        child: text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: text16Normal(text: subtitle),
      ),
      _nextbutton(index, controller, context),
    ],
  );
}

Widget _nextbutton(
  double index,
  PageController controller,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      if (index < 3.0) {
        controller.animateToPage(
          index.toInt(),
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        Navigator.of(context).pushNamed('/signIn');
      }
      print("Tapped");
      print("Index is $index");
    },
    child: Container(
      margin: EdgeInsets.only(top: 100),
      height: 50,
      width: 325,

      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(
          text: index == 3 ? "Get Started" : "Next",
          color: Colors.white,
        ),
      ),
    ),
  );
}
