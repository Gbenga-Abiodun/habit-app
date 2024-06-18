import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/course/course_page.dart';
import 'package:page_transition/page_transition.dart';

import '../routes/nav_routes.dart';

class CoursePageNavigation extends GetView<NavController> {
  const CoursePageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controller.coursePageNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return PageTransition(
          settings: settings,
          type: PageTransitionType.rightToLeft,
          child: settings.name == AppRoutes.courseDetails
              ? Container()
              : CoursePage(),
        );
      },
    );
  }
}
