import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/home/controller/homeindex_notifier.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/utils/image_res.dart';
import 'package:learner/common/widgets/app_image.dart';
import 'package:learner/common/widgets/app_shadow.dart';
import 'package:learner/common/widgets/text_widgets.dart';
import 'package:learner/global/global.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text24Normal(
      text: "Hello,",
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.bold,
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text24Normal(
      text: Global.storageService.getUserProfile().name,

      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
    );
    ;
  }
}

class AppBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  AppBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.h,
          width: 325.w,
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              ref.read(homeIndexNotifierProvider.notifier).changeIndex(value);
            },
            children: [
              _bannerElement(imagePath: ImageRes.banner1),
              _bannerElement(imagePath: ImageRes.banner2),
              _bannerElement(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        DotsIndicator(
          dotsCount: 3,
          position: ref.watch(homeIndexNotifierProvider).toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(30.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.sp),
            ),
          ),
        ),
      ],
    );
    ;
  }
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

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all courses
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text16Normal(
                text: "Choice your courses",
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
              const Text14Normal(text: "See All"),
            ],
          ),
        ),
        //course item button
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
                decoration: appBoxShadow(radius: 8.sp),
                child: const Text11Normal(text: "All"),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
                // decoration: appBoxShadow(radius: 8.sp),
                child: const Text11Normal(
                  text: "Popular",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
                // decoration: appBoxShadow(radius: 8.sp),
                child: const Text11Normal(
                  text: "Newest",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: ScrollPhysics(),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
        ),
        itemBuilder: (context, index) {
          return appImage();
        },
      ),
    );
  }
}
