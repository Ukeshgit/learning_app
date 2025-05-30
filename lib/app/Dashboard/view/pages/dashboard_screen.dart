import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/Dashboard/notifier/app_navIndex.dart';
import 'package:learner/app/Dashboard/view/widgets/widgets.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/widgets/app_shadow.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final appIndexProvider = ref.watch(appNavindexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: appIndexProvider,
              onTap: (value) {
                ref.read(appNavindexProvider.notifier).changeIndex(value);
              },
              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElementStatus,
              unselectedItemColor: AppColors.primaryFourElementText,
            ),
          ),
          body: Container(
            child: Center(child: screens(index: appIndexProvider)),
          ),
        ),
      ),
    );
  }
}
