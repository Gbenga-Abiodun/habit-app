import 'package:get/get.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:habit_app/controller/auth_controller.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/controller/onboarding_controller.dart';
import 'package:habit_app/controller/user_controller.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/controller/validation_controller.dart';
import 'package:habit_app/data/api/api_client.dart';
import 'package:habit_app/data/repo/comment_repository.dart';
import 'package:habit_app/databases/user_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(
    () => ApiClient(
      sharedPreferences: sharedPreferences,
      appBaseUrl: AppConstants.baseUrl,
    ),
  );
  // storage
  Get.lazyPut(
    () => sharedPreferences,
    fenix: true,
  );

  // databases

  Get.lazyPut(
    () => UserDatabase(),
  );

  // repository
  Get.lazyPut(
    () => CommentRepository(
      apiClient: Get.find(),
    ),
  );

  // controllers

  Get.lazyPut(
    () => OnboardingController(),
    fenix: true,
  );
  Get.lazyPut(
    () => UserController(
      sharedPreferences: Get.find(),
      userDatabase: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => AuthController(
      sharedPreferences: Get.find(),
      utilsController: Get.find(),
      userController: Get.find(),
    ),
  );
  Get.lazyPut(
    () => ValidationController(authController: Get.find()),
    fenix: true,
  );
  Get.lazyPut(
    () => UtilsController(),
    fenix: true,
  );
  Get.lazyPut(
    () => NavController(
      sharedPreferences: Get.find(),
    ),
  );
}
