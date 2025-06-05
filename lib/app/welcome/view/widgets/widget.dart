import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learner/common/utils/constants.dart';

import 'package:learner/common/widgets/app_shadow.dart';
import 'package:learner/common/widgets/text_widgets.dart';
import 'package:learner/global/global.dart';

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
        child: Text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text16Normal(text: subtitle),
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
        //remember here
        Global.storageService.setBool(
          Appconstants.STORAGE_DEVICE_OPEN_FIRST_KEY,
          true,
        );

        Navigator.of(context).pushNamed('/signIn');
      }
      if (kDebugMode) {
        print("Tapped");
        print("Index is $index");
      }
    },
    child: Container(
      margin: EdgeInsets.only(top: 100),
      height: 50,
      width: 325,

      decoration: appBoxShadow(),
      child: Center(
        child: Text16Normal(
          text: index == 3 ? "Get Started" : "Next",
          color: Colors.white,
        ),
      ),
    ),
  );
}
