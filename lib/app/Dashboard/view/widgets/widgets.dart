import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/common/utils/app_colors.dart';

List<BottomNavigationBarItem> bottomTabs = [
  _bottomTabItem(
    label: "Home",
    icon: Icons.home,
    activeIcon: Icons.home_filled,
  ),
  _bottomTabItem(
    label: "Profile",
    icon: Icons.person,
    activeIcon: Icons.person,
  ),
  _bottomTabItem(label: "Search", icon: Icons.search, activeIcon: Icons.search),
];
BottomNavigationBarItem _bottomTabItem({
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

Widget screens({int index = 0}) {
  List screen = [Icon(Icons.home), Icon(Icons.person), Icon(Icons.search)];
  return screen[index];
}
