import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/authentication/view/widgets/sign_in_widgets.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/utils/constants.dart';
import 'package:learner/common/widgets/text_widgets.dart';
import 'package:learner/global/global.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Home"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text24Normal(
              text: "Hello,",
              color: AppColors.primaryThreeElementText,
              fontWeight: FontWeight.bold,
            ),

            text24Normal(
              text: Global.storageService.getString(
                Appconstants.STORAGE_USER_PROFILE_KEY,
              ),
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
