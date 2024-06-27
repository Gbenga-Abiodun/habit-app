import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:habit_app/databases/user_database.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../reference/references.dart';

class UserController extends GetxController {
  final SharedPreferences sharedPreferences;

  final UserDatabase userDatabase;

  UserController({required this.sharedPreferences, required this.userDatabase});



  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<void> getUser({required String userId}) async {
    try {
      final database = await userDatabase.getItem(
        sharedPreferences.getString(AppConstants.userId).toString(),
      );
      print(database);
      if (database.isEmpty) {
        final document = await fireStore
            .collection(AppConstants.userCollectionName)
            .doc(userId)
            .get();
        final data = UserModel.fromSnap(
          document,
        );
        print(data);

        _userModel = data;
        await userDatabase.createItem(
          email: _userModel!.email,
          userName: _userModel!.userName,
          profilePhoto: _userModel!.profilePhoto,
          taskCompleted: _userModel!.taskCompleted,
          totalWorkHours: _userModel!.totalWorkHours,
          user_id: _userModel!.user_id,
        );

        print("using online" + _userModel.toString());
      } else {
        final databaseNew = await userDatabase.getItem(
          sharedPreferences.getString(AppConstants.userId).toString(),
        );
        _userModel = databaseNew.first;
        print("using database" + databaseNew.toString());
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  void loadLoggedInUser() {
    getUser(
      userId: sharedPreferences.getString(AppConstants.userId).toString(),
    );
  }
}
