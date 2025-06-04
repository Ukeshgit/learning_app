import 'package:flutter/widgets.dart';
import 'package:learner/common/utils/app_colors.dart';
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
