import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/widgets/text_widgets.dart';

AppBar buildAppBar({String text = "Log In"}) {
  return AppBar(
    title: text16Normal(text: text, color: AppColors.primaryText),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(
        1,
      ), //at a distance of 100 from the appbar,create a container of height ... towards upward
      child: Container(color: Colors.grey.shade300, height: 1),
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

Widget appTextField({
  TextEditingController? controller,
  String label = "",
  String text = "Email",
  IconData prefixIcon = Icons.email,
  double borderRadius = 15,
  bool obscureText = false,
  void Function(String value)? func,
}) {
  return Container(
    margin: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          onChanged: func,
          maxLines: 1,
          autocorrect: false,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefix: Padding(padding: EdgeInsets.only(left: 10.w)),
            hintText: label,
            prefixIcon: Icon(prefixIcon),

            hintStyle: TextStyle(color: AppColors.primaryThreeElementText),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
