import 'package:habit_app/pages/community/community_page.dart';
import 'package:habit_app/pages/course/course_details_page.dart';
import 'package:habit_app/pages/profile/profile_page.dart';
import 'package:habit_app/pages/settings/settings_page.dart';

import '../pages/habit/new_habit_page.dart';

class AppRoutes {
  static final pages = {
    newHabit: (context) => const NewHabitPage(),
    courseDetails: (context) => const CourseDetailsPage(),
    profilePage: (context) => const ProfilePage(),

  };

  static const newHabit = '/new-habit';

  static const courseDetails = "/course-details";
  static const profilePage = "/profile-page";

}