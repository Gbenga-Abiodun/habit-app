import 'package:get/get.dart';
import 'package:habit_app/controller/onboarding_controller.dart';

Future<void> init()async{
  Get.lazyPut(() => OnboardingController(), fenix: true,);
}