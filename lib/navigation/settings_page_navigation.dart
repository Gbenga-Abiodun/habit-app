import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/pages/habit/new_habit_page.dart';
import 'package:habit_app/pages/settings/settings_page.dart';

import '../routes/route_helper.dart';
import '../routes/route_keys.dart';

class SettingsPageNavigation extends StatelessWidget {
  const SettingsPageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RouteKeys.settingsKey,),
      onGenerateRoute: (RouteSettings settings) {
        return GetPageRoute(
          transition: Transition.rightToLeft,
          page: () {
            if (settings.name == RouteHelpers.newHabit) {
              return NewHabitPage();
            } else {
              return SettingsPage();
            }
          },
        );
      },
    );
  }
}
