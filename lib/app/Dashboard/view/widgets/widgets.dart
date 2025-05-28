import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/common/utils/app_colors.dart';

List<BottomNavigationBarItem> bottomTabs = [
  bottomTabItem(label: "Home", icon: Icons.home, activeIcon: Icons.home_filled),
  bottomTabItem(label: "Profile", icon: Icons.person, activeIcon: Icons.person),
  bottomTabItem(label: "Search", icon: Icons.search, activeIcon: Icons.search),
];
BottomNavigationBarItem bottomTabItem({
  String label = "",
  IconData? icon,
  IconData? activeIcon,
}) => BottomNavigationBarItem(
  icon: SizedBox(
    height: 15.h,
    width: 15.w,
    child: Icon(icon, color: AppColors.primaryFourElementText),
  ),
  activeIcon: Icon(activeIcon, color: AppColors.primaryElementStatus),
  label: label,
);
