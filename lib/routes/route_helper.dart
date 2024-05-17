import 'package:get/get.dart';
import 'package:habit_app/pages/onBoarding/onboarding_page.dart';
import 'package:habit_app/pages/splash/splash_page.dart';

class RouteHelpers{


  static const String initial = "/";

  static String getInitial() => '$initial';
  static const String onBoarding = "/onboarding-page";

  static String getOnBoarding() => '$onBoarding';


  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => SplashPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: onBoarding,
      page: () => OnboardingPage(),
      transition: Transition.fade,
    ),

  ];

}