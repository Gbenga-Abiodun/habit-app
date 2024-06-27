import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habit_app/pages/auth/forgotten_password_page.dart';
import 'package:habit_app/pages/community/community_page.dart';
import 'package:habit_app/pages/course/course_page.dart';
import 'package:habit_app/pages/habit/new_habit_page.dart';
import 'package:habit_app/pages/main/main_page.dart';
import 'package:habit_app/pages/onBoarding/onboarding_page.dart';
import 'package:habit_app/pages/reminder/add_reminder.dart';
import 'package:habit_app/pages/settings/settings_page.dart';
import 'package:habit_app/pages/splash/splash_page.dart';
import 'package:habit_app/pages/supportive/supportive_page.dart';
import 'package:habit_app/utils/colors.dart';

import '../pages/auth/sign_in_page.dart';
import '../pages/auth/sign_up_page.dart';
import '../pages/home/home_page.dart';

class RouteHelpers {
  static const String initial = "/";

  static String getInitial() => '$initial';
  static const String onBoarding = "/onboarding-page";

  static String getOnBoarding() => '$onBoarding';
  static const String signUp = "/sign-up";
  static String getSignUp() => '$signUp';
  static const String signIn = "/sign-in";
  static String getSignIn() => '$signIn';
  static const String supportive = "/supportive-page";

  static String getSupportive() => '$supportive';
  static const String homePage = "/home-page";

  static String getHomePage() => '$homePage';
  static const String mainPage = "/main-page";

  static String getMainPage() => '$mainPage';

  static const String community = "/community-page";

  static String getCommunityPage() => '$community';

  static const String profile = "/settings-page";

  static String getProfilePage() => '$profile';

  static const String settings = "/settings-page";

  static String getSettingsPage() => '$settings';
  static const String newHabit = "/new-habit";





  static String getNewHabitPage() => '$newHabit';

  static const String course = "/course-page";

  static String getCoursePage() => '$course';

  static const String addReminder = "/add-reminder-page";

  static String getAddReminderPage() => '$addReminder';

  static const String resetPassword = "/reset-page";

  static String getReset() => '$resetPassword';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const SplashPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: course,
      page: () => const CoursePage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: newHabit,
      page: () =>  NewHabitPage(),
      transition: Transition.rightToLeft,

    ),
    GetPage(
      name: settings,
      page: () => const SettingsPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: mainPage,
      page: () =>  MainPage(),
      // transition: Transition.rightToLeft,
    ),
    GetPage(
      name: community,
      page: () => const CommunityPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: onBoarding,
      page: () => OnboardingPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: supportive,
      page: () => const SupportivePage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: signIn,
      page: () => SignInPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: homePage,
      page: () =>  HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: addReminder,
      page: () => AddReminder(),

    ),
    GetPage(
      name: resetPassword,
      page: () => ForgottenPasswordPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: signUp,
      page: () => SignUpPage(),
      transition: Transition.cupertinoDialog,
    ),
  ];
}
