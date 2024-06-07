import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:habit_app/generated/assets.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/utils/dimensions.dart';

import '../model/onboarding_model.dart';

class OnboardingController extends GetxController {


  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onBoardingList.length - 1;

  var pageController = PageController();



  void forwardAction() {
    if (isLastPage) {
      Get.toNamed(
        RouteHelpers.getSupportive(),
      );
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease,);
      update();
    }
  }

  void goToSupportive() {
    Get.toNamed(
      RouteHelpers.getSupportive(),
    );
  }

  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      Assets.svgsOnboardingOneSvg,
      "Welcome to \nMonumental habits",
      "We can help you to be a better version of yourself.",
      Dimensions.height15 * 23.33333333333333,
      Dimensions.height15 * 32.46666666666667,
    ),
    OnBoardingModel(
      Assets.svgsOnBoardingTwo,
      "CREATE NEW HABIT EASILY",
      "We can help you to be a better version of yourself.",
      Dimensions.height15 * 26.6,
      Dimensions.height15 * 26.6,
    ),
    OnBoardingModel(
      Assets.svgsOnboardingThree,
      "KEEP TRACK OF YOUR PROGRESS",
      "We can help you to be a better version of yourself.",
      Dimensions.height15 * 27.6,
      Dimensions.height15 * 27.2,
    ),
  ];
}
