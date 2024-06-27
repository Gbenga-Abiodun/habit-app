import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/reminder/add_reminder.dart';
import 'package:habit_app/pages/reminder/reminder_page.dart';
import 'package:habit_app/routes/route_helper.dart';

import '../utils/colors.dart';

class ReminderPageNavigation extends GetView<NavController> {
  const ReminderPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controller.reminderPageNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return GetPageRoute(
          transition: Transition.rightToLeft,
          page: () {
            if (settings.name == RouteHelpers.addReminder) {
              return AddReminder();
            } else {
              return ReminderPage();
            }
          },
        );
      },
    );
  }
}
