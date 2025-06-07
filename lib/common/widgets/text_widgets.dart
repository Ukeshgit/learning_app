import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/common/utils/app_colors.dart';

class Text24Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  const Text24Normal({
    super.key,
    this.text,
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 24, fontWeight: fontWeight),
    );
  }
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text16Normal({
    super.key,
    this.fontWeight = FontWeight.normal,
    this.text = "",
    this.color = AppColors.primarySecondaryElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 16, fontWeight: fontWeight),
    );
    ;
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text14Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primaryThreeElementText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 16, fontWeight: fontWeight),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text10Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primaryThreeElementText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 10, fontWeight: fontWeight),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text11Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primaryElementText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 11, fontWeight: fontWeight),
    );
  }
}

Widget textUnderline({String text = "Forgot Password?"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,

        decoration: TextDecoration.underline,
        color: AppColors.primaryText,
      ),
    ),
  );
}
