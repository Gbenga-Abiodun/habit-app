import 'package:get/get.dart';
import 'package:habit_app/generated/assets.dart';
import 'package:habit_app/utils/dimensions.dart';

import '../model/onboarding_model.dart';

class OnboardingController extends GetxController {
  List<OnBoardingModel> onBoardingList = [
    
    OnBoardingModel(Assets.imagesOnboardingOneImg, "WELCOME TO Monumental habits", "We can help you to be a better version of yourself.", Dimensions.height15 * 23.33333333333333, Dimensions.height15 * 32.46666666666667,),
    OnBoardingModel(Assets.svgsOnBoardingTwo, "CREATE NEW HABIT EASILY", "We can help you to be a better version of yourself.", Dimensions.height15 * 26.6, Dimensions.height15 * 26.6,),
    OnBoardingModel(Assets.svgsOnboardingThree, "KEEP TRACK OF YOUR PROGRESS", "We can help you to be a better version of yourself.", Dimensions.height15 *27.6, Dimensions.height15 *27.2,),

  ];
}
