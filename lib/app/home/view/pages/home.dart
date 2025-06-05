import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/authentication/view/widgets/sign_in_widgets.dart';
import 'package:learner/app/home/controller/homeindex_notifier.dart';
import 'package:learner/app/home/view/widgets/home_widgets.dart';
import 'package:learner/common/widgets/search_widget.dart';
import 'package:learner/global/global.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildAppBar(text: "Home"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            helloText(),
            userName(),
            SizedBox(height: 20.h),
            searchBox(),
            SizedBox(height: 20.h),
            banner(ref: ref),
          ],
        ),
      ),
    );
  }
}
