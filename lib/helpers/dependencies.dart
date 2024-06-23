import 'package:get/get.dart';
import 'package:habit_app/controller/auth_controller.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/controller/onboarding_controller.dart';
import 'package:habit_app/controller/user_controller.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/controller/validation_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(
    () => sharedPreferences,
    fenix: true,
  );

  // controllers

  Get.lazyPut(
    () => OnboardingController(),
    fenix: true,
  );
  Get.lazyPut(
    () => UserController(sharedPreferences: Get.find(),),
    fenix: true,
  );
  Get.lazyPut(
    () => AuthController(sharedPreferences: Get.find(),),

  );
  Get.lazyPut(
    () => ValidationController(),
    fenix: true,
  );
  Get.lazyPut(
    () => UtilsController(),
    fenix: true,
  );
  Get.lazyPut(
    () => NavController(sharedPreferences: Get.find(),),
  );
}
