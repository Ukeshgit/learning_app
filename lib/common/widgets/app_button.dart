import 'package:flutter/material.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/widgets/app_shadow.dart';
import 'package:learner/common/widgets/text_widgets.dart';

Widget appButton({
  String buttonName = "",
  double width = 325,
  double height = 50,
  bool isLogin = true,
  void Function()? ontap,
  Color color = AppColors.primaryBackground,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: width,
      height: height,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : AppColors.primaryBackground,
        border: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Center(child: text16Normal(text: buttonName, color: color)),
    ),
  );
}
