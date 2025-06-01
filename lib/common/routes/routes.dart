import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learner/app/Dashboard/view/pages/dashboard_screen.dart';
import 'package:learner/app/authentication/view/pages/sign_in_screen.dart';
import 'package:learner/app/authentication/view/pages/sign_up_screen.dart';
import 'package:learner/app/home/view/home.dart';
import 'package:learner/app/welcome/view/screen/welcome_screen.dart';
import 'package:learner/common/routes/app_routes_name.dart';

class AppPages {
  static List<dynamic> routes() {
    return [
      RouteEntity(path: AppRoutesName.WELCOME, page: WelcomeScreen()),
      RouteEntity(path: AppRoutesName.SIGN_IN, page: SignInScreen()),
      RouteEntity(path: AppRoutesName.SIGN_UP, page: SignUpScreen()),
      RouteEntity(path: AppRoutesName.DASHBOARD, page: DashboardScreen()),
      RouteEntity(path: AppRoutesName.HOME, page: Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("Clicked route is: ${settings.name}");
    }
    if (settings.name != null) {
      var result = routes().where(
        (element) => element.path == settings.name,
      ); //it will return list of matches one by one i.e.setting.name is path

      //if we used the app for the first time or not
      if (result.first.path == AppRoutesName.WELCOME) {
        print("on welcome screen");
      }
    }

    return MaterialPageRoute(
      builder: (_) => WelcomeScreen(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
