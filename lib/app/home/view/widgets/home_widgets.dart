import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/utils/image_res.dart';
import 'package:learner/common/widgets/text_widgets.dart';
import 'package:learner/global/global.dart';

Widget helloText() {
  return text24Normal(
    text: "Hello,",
    color: AppColors.primaryThreeElementText,
    fontWeight: FontWeight.bold,
  );
}

Widget userName() {
  return
  // Global.storageService.getUserProfile().access_token == null
  //     ? text24Normal(
  //       text: "Guest",
  //       color: AppColors.primaryText,
  //       fontWeight: FontWeight.bold,
  //     )
  //     :
  text24Normal(
    text: Global.storageService.getUserProfile().name,

    color: AppColors.primaryText,
    fontWeight: FontWeight.bold,
  );
}

Widget banner() {
  return Column(
    children: [
      Container(
        height: 160.h,
        width: 325.w,
        child: PageView(
          children: [
            _bannerElement(imagePath: ImageRes.banner1),
            _bannerElement(imagePath: ImageRes.banner2),
            _bannerElement(imagePath: ImageRes.banner3),
          ],
        ),
      ),
    ],
  );
}

Widget _bannerElement({required String imagePath}) {
  return Container(
    height: 160.h,
    width: 222.w,
    decoration: BoxDecoration(
      // color: Colors.red,
      image: DecorationImage(image: AssetImage(imagePath)),
    ),
  );
}
