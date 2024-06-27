import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/route_helper.dart';

class NavController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  var tabIndex = 0.obs;

  var changeToCheckMark = false.obs;

  GlobalKey<NavigatorState> homePageNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> coursePageNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> reminderPageNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> communityPageNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> settingsPageNavigatorKey =
      GlobalKey<NavigatorState>();

  NavController({required this.sharedPreferences});
  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  void checkLoggedIn() {
    var loggedIn = sharedPreferences.getString(AppConstants.userId);
    // String? userId = .toString();
    if (loggedIn == null) {
      Get.offAllNamed(
        RouteHelpers.getOnBoarding(),
      );
    } else {
      Get.offAllNamed(
        RouteHelpers.getMainPage(),
      );
    }
  }
}
