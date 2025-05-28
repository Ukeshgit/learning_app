import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/common/utils/app_colors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sr = 1,
  double br = 2,
  Border? border,
}) {
  return BoxDecoration(
    border: border,
    color: color,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        spreadRadius: sr,
        blurRadius: br,
        offset: Offset(0, 5),
      ),
    ],
  );
}

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sr = 1,
  double br = 2,
  Border? border,
}) {
  return BoxDecoration(
    border: border,
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.sp),
      topRight: Radius.circular(20.sp),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        spreadRadius: sr,
        blurRadius: br,
        offset: Offset(0, 5),
      ),
    ],
  );
}
