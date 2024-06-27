import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/habit/new_habit_page.dart';
import 'package:habit_app/pages/home/home_page.dart';
import 'package:habit_app/routes/route_keys.dart';
import 'package:page_transition/page_transition.dart';

import '../routes/route_helper.dart';

class HomePageNavigation extends GetView<NavController> {
  const HomePageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(
        RouteKeys.homeKey,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return GetPageRoute(
          transition: Transition.rightToLeft,
          page: () {
            if (settings.name == RouteHelpers.newHabit) {
              return NewHabitPage();
            } else {
              return HomePage();
            }
          },
        );
      },
    );
  }
}
