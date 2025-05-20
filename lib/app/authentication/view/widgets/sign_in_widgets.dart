import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/widgets/text_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    title: text16Normal(text: "Log In", color: AppColors.primaryText),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(
        1,
      ), //at a distance of 100 from the appbar,create a container of height ... towards upward
      child: Container(color: Colors.red, height: 1),
    ),
    centerTitle: true,
  );
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google_logo.svg"),
        _loginButton("assets/icons/apple_logo.svg"),
        _loginButton("assets/icons/facebook_logo.svg"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {
      print("Tapped");
    },
    child: Container(
      width: 40.w,
      height: 40.h,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: SvgPicture.asset(imagePath),
    ),
  );
}

Widget appTextField(String label) {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h, bottom: 30.h),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primarySecondaryElementText),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primarySecondaryElementText),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primarySecondaryElementText),
        ),
      ),
    ),
  );
}
