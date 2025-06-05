import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/utils/image_res.dart';
import 'package:learner/common/widgets/app_image.dart';
import 'package:learner/common/widgets/app_shadow.dart';

Widget searchBox() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40.h,
        width: 270.w,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourElementText),

          br: 20,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primaryFourElementText,
            ),
            hintStyle: TextStyle(color: AppColors.primaryFourElementText),
            hintText: "Search for a course",
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 40.h,
          width: 36.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: appBoxShadow(
            color: AppColors.primaryElement,
            radius: 8.sp,

            // border: Border.()
          ),
          child: appImage(imagePath: ImageRes.searchFilter),
        ),
      ),
    ],
  );
}
