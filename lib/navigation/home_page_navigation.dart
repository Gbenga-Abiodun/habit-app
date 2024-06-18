import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/habit/new_habit_page.dart';
import 'package:habit_app/pages/home/home_page.dart';
import 'package:habit_app/routes/nav_routes.dart';

class HomePageNavigation extends GetView<NavController> {
  const HomePageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controller.homePageNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              if (settings.name == AppRoutes.newHabit) {
                return const NewHabitPage();
              }
              return const HomePage();
            });
      },
    );
  }
}
