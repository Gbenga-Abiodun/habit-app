import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/course/course_page.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/habit/new_habit_page.dart';
import '../routes/nav_routes.dart';

class CoursePageNavigation extends GetView<NavController> {
  const CoursePageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controller.coursePageNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {

        Widget child;

        if (settings.name == AppRoutes.courseDetails) {
          child = Container();
        } else if (settings.name == AppRoutes.newHabit) {
          child = NewHabitPage();
        } else {
          child = const CoursePage();
        }
        return PageTransition(
          settings: settings,
          type: PageTransitionType.rightToLeft,
          child: child,
        );
      },
    );
  }
}
