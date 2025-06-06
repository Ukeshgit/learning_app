import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/utils/image_res.dart';
import 'package:learner/common/widgets/app_image.dart';
import 'package:learner/common/widgets/app_shadow.dart';
import 'package:learner/common/widgets/text_widgets.dart';

AppBar buildAppBar({String text = "Log In"}) {
  return AppBar(
    title: Text16Normal(text: text, color: AppColors.primaryText),
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
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
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
      child: Image.asset(imagePath),
    ),
  );
}

Widget appTextField({
  TextEditingController? controller,
  String label = "",
  String text = "Email",
  String prefixPath = "",
  double borderRadius = 15,
  bool obscureText = false,
  void Function(String value)? func,
  void Function()? onSuffixIconPressed,
  Widget suffixIcon = const SizedBox(),
}) {
  return Container(
    margin: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          onChanged: func,
          maxLines: 1,
          autocorrect: false,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: label,
            prefixIcon: Padding(
              padding: EdgeInsets.all(11.w),
              child: Image.asset(
                prefixPath,
                height: 8.h,
                width: 8.w,
                // fit: BoxFit.contain,
              ),
            ),

            suffixIcon: IconButton(
              icon: suffixIcon,
              onPressed: onSuffixIconPressed,
            ),

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

AppBar homeBuildAppBar({String text = "Log In"}) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(w: 18, h: 12, imagePath: ImageRes.menu),
          const AppBoxDecorationImage(),
        ],
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(
        1,
      ), //at a distance of 100 from the appbar,create a container of height ... towards upward
      child: Container(color: Colors.grey.shade300, height: 1),
    ),
    centerTitle: true,
  );
}
