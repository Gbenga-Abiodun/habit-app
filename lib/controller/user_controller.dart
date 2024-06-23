import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../reference/references.dart';
import '../routes/route_helper.dart';

class UserController extends GetxController {
  final SharedPreferences sharedPreferences;

  UserController({required this.sharedPreferences});

  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  Future<void> getUser({required String userId}) async {
    await fireStore.collection("users").doc(userId).get().then((onValue) {
      print(onValue);

      _userModel = UserModel.fromSnap(onValue);
      print(_userModel);
      print(_userModel!.userName);

      print("Success");
    }).catchError((onError) {
      if (onError is FirebaseException) {
        print(
          onError,
        );
      }
    });
  }


  void loadLoggedInUser(){
    getUser(userId: sharedPreferences.getString(AppConstants.userId).toString(),);
  }
}
