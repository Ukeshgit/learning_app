import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/widgets/app_shadow.dart';

Widget searchBox() {
  return Row(
    children: [
      Container(
        height: 40.h,
        width: 280.w,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourElementText),

          br: 20,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primaryFourElementText,
            ),
            hintStyle: TextStyle(color: AppColors.primaryFourElementText),
            hintText: "Search",
          ),
        ),
      ),
    ],
  );
}
