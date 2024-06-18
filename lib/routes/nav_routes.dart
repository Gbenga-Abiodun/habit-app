import 'package:habit_app/pages/community/community_page.dart';
import 'package:habit_app/pages/course/course_details_page.dart';
import 'package:habit_app/pages/profile/profile_page.dart';
import 'package:habit_app/pages/settings/settings_page.dart';

import '../pages/habit/new_habit_page.dart';

class AppRoutes {
  static final pages = {
    newHabit: (context) => NewHabitPage(),
    courseDetails: (context) => CourseDetailsPage(),
    profilePage: (context) => ProfilePage(),

  };

  static const newHabit = '/new-habit';

  static const courseDetails = "/course-details";
  static const profilePage = "/profile-page";

}