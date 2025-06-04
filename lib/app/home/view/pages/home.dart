import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/authentication/view/widgets/sign_in_widgets.dart';
import 'package:learner/app/home/view/widgets/home_widgets.dart';
import 'package:learner/common/widgets/search_widget.dart';
import 'package:learner/global/global.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print(Global.storageService.getUserProfile().name);
    return Scaffold(
      appBar: buildAppBar(text: "Home"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [helloText(), userName(), searchBox()],
        ),
      ),
    );
  }
}
