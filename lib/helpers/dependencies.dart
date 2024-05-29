import 'package:get/get.dart';
import 'package:habit_app/controller/onboarding_controller.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/controller/validation_controller.dart';

Future<void> init() async {


  // controllers
  Get.lazyPut(
    () => OnboardingController(),
    fenix: true,
  ); Get.lazyPut(
    () => ValidationController(),
    fenix: true,
  ); Get.lazyPut(
    () => UtilsController(),
    fenix: true,
  );
}
