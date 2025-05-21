import 'package:flutter/material.dart';
import 'package:learner/common/utils/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 1,
      centerTitle: true,
      color: Colors.lightGreen.withValues(alpha: 0.01),
    ),
    iconTheme: IconThemeData(color: AppColors.primaryText),
  );
}
