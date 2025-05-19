import 'package:flutter/material.dart';
import 'package:learner/common/utils/app_colors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sr = 1,
  double br = 2,
}) {
  return BoxDecoration(
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
