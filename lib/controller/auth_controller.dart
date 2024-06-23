import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:habit_app/controller/user_controller.dart';
import 'package:habit_app/model/user_model.dart';
import 'package:habit_app/reference/references.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var userController = Get.find<UserController>();

  AuthController({required this.sharedPreferences});

  Future<void> createAccount(
      {required String userName,
      required String password,
      required String email}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        final UserModel userData = UserModel(
          userName: userName,
          email: user.user!.email.toString(),
          profilePhoto: "profilePhoto",
          totalWorkHours: 0,
          taskCompleted: 0,
          id: user.user!.uid,
        );
        sharedPreferences.setString(AppConstants.userId, user.user!.uid);

        await fireStore
            .collection("users")
            .doc(user.user!.uid)
            .set(
              userData.toMap(),
            )
            .then((onValue) async{
              await userController.getUser(userId: user.user!.uid).then((onValue){
                print("Success");
                Get.offAllNamed(
                  RouteHelpers.getMainPage(),
                );
              });

        }).catchError((onError) {
          if (onError is FirebaseException) {
            print(
              onError,
            );
          } else {
            print("Something went wrong");
          }
        });
      }).catchError((onError) {
        if (onError is FirebaseAuthException) {
          print(
            onError,
          );
        } else {
          print("Something went wrong");
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginAccount(
      {required String password, required String email}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        sharedPreferences.setString(AppConstants.userId, user.user!.uid);
        await userController.getUser(userId: user.user!.uid).then((onValue) {
          Get.offAllNamed(
            RouteHelpers.getMainPage(),
          );
        });
      }).catchError((onError) {
        if (onError is FirebaseAuthException) {
          print(
            onError,
          );
        } else {
          print("Something went wrong");
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
