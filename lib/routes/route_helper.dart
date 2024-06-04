import 'package:get/get.dart';
import 'package:habit_app/pages/auth/forgotten_password_page.dart';
import 'package:habit_app/pages/onBoarding/onboarding_page.dart';
import 'package:habit_app/pages/splash/splash_page.dart';
import 'package:habit_app/pages/supportive/supportive_page.dart';

import '../pages/auth/sign_in_page.dart';
import '../pages/auth/sign_up_page.dart';

class RouteHelpers{


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
  static const String resetPassword = "/reset-page";

  static String getReset() => '$resetPassword';


  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => SplashPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: onBoarding,
      page: () => OnboardingPage(),
      transition: Transition.cupertinoDialog,
    ),

    GetPage(
      name: supportive,
      page: () => SupportivePage(),
      transition: Transition.cupertinoDialog,
    ),

    GetPage(
      name: signIn,
      page: () => SignInPage(),
      transition: Transition.cupertinoDialog,
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