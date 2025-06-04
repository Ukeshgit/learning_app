import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learner/app/home/view/pages/home.dart';

import 'package:learner/common/utils/image_res.dart';

List<BottomNavigationBarItem> bottomTabs = [
  _bottomTabItem(
    label: "Home",
    iconPath: ImageRes.home,
    activePath: ImageRes.home,
  ),

  _bottomTabItem(
    label: "Search",
    iconPath: ImageRes.search,
    activePath: ImageRes.search,
  ),
  _bottomTabItem(
    label: "Search",
    iconPath: ImageRes.play_circle,
    activePath: ImageRes.play_circle,
  ),
  _bottomTabItem(
    label: "Search",
    iconPath: ImageRes.message_circle,
    activePath: ImageRes.message_circle,
  ),
  _bottomTabItem(
    label: "Profile",
    iconPath: ImageRes.person,
    activePath: ImageRes.person,
  ),
];
BottomNavigationBarItem _bottomTabItem({
  String label = "",
  String iconPath = "",
  String activePath = "",
}) => BottomNavigationBarItem(
  icon: SizedBox(
    height: 15.h,
    width: 15.w,
    child: Container(
      child: SvgPicture.asset(iconPath),
      height: 20.h,
      width: 20.w,
    ),
  ),
  activeIcon: Container(
    child: SvgPicture.asset(activePath),
    height: 20.h,
    width: 20.w,
  ),
  label: label,
);

Widget screens({int index = 0}) {
  List screen = [
    Home(),
    Icon(Icons.person),
    Icon(Icons.search),
    Icon(Icons.person),
    Icon(Icons.person),
  ];
  return screen[index];
}
