import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learner/app/Dashboard/view/pages/dashboard_screen.dart';
import 'package:learner/app/authentication/view/pages/sign_in_screen.dart';
import 'package:learner/app/authentication/view/pages/sign_up_screen.dart';
import 'package:learner/app/home/view/pages/home.dart';
import 'package:learner/app/welcome/view/screen/welcome_screen.dart';
import 'package:learner/common/routes/app_routes_name.dart';
import 'package:learner/common/utils/constants.dart';
import 'package:learner/global/global.dart';

class AppPages {
  static List<RouteEntity> routes() {
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
      // print("Clicked route is: ${settings.name}");
    }

    if (settings.name != null) {
      var result = routes().where(
        (element) => element.path == settings.name,
      ); //it will return list of matches one by one i.e.setting.name is checked with path
      if (result.isNotEmpty) {
        //if we used the app for the first time or not->first time,then false otherwise true
        bool deviceNotFirstTime = Global.storageService.getDeviceFirstOpen();
        // print("Device Already opened first time is: $deviceNotFirstTime");

        if (result.first.path == AppRoutesName.WELCOME && deviceNotFirstTime) {
          // print("App had already opened first time,so going to sign in screen");

          bool isloggedin = Global.storageService.isLoggedIn();
          // print("isloggedin:$isloggedin");

          if (isloggedin) {
            return MaterialPageRoute(
              builder: (_) => DashboardScreen(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => SignInScreen(),
              settings: settings,
            );
          }
        } else {
          if (kDebugMode) {
            // print("Path is ${result.first.path}");
          }
          //this will give pages related to that path in the route list
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
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
