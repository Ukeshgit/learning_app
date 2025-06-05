import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/authentication/view/widgets/sign_in_widgets.dart';
import 'package:learner/app/home/controller/homeindex_notifier.dart';
import 'package:learner/app/home/view/widgets/home_widgets.dart';
import 'package:learner/common/widgets/search_widget.dart';
import 'package:learner/global/global.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    controller = PageController(
      initialPage: ref.watch(homeIndexNotifierProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Home"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelloText(),
            const UserName(),
            SizedBox(height: 20.h),
            searchBox(),
            SizedBox(height: 20.h),
            AppBanner(controller: controller, ref: ref),
          ],
        ),
      ),
    );
  }
}
