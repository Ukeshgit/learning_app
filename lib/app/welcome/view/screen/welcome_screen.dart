import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/welcome/controller/welcome_notifier.dart';
import 'package:learner/app/welcome/view/widgets/widget.dart';

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              //for showing three welcome screen
              Container(
                margin: EdgeInsets.only(top: 50),
                child: PageView(
                  onPageChanged: (value) {
                    print("Onchanged value is :$value");

                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: controller,
                  children: [
                    //first page
                    appOnBoardingPage(
                      context: context,
                      controller,
                      imagepath: "assets/images/reading.png",
                      title: "First See learning",
                      subtitle:
                          "Forgot about all paper all knowledge are in one learning",
                      index: 1,
                    ),
                    appOnBoardingPage(
                      context: context,
                      controller,
                      imagepath: "assets/images/boy.png",
                      title: "connect with everyone",
                      subtitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      index: 2,
                    ),
                    appOnBoardingPage(
                      context: context,
                      controller,
                      imagepath: "assets/images/man.png",
                      title: "Always fascinated learning",
                      subtitle:
                          "Anytime,anywhere. The time is at your discretion. So Study anywhere",
                      index: 3,
                    ),
                  ],
                ),
              ),
              //for showing dots indicator
              Positioned(
                bottom: 50.h,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: index.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
