import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/course/course_page.dart';

import '../routes/nav_routes.dart';

class CoursePageNavigation extends GetView<NavController> {
  const CoursePageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controller.coursePageNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              if (settings.name == AppRoutes.courseDetails) {
                return  Container();
              }
              return const CoursePage();
            });
      },
    );
  }
}
