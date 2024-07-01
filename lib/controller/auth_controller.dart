import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habit_app/base/custom_dialog.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:habit_app/controller/user_controller.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/model/user_model.dart';
import 'package:habit_app/reference/references.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  final UserController userController;
  final UtilsController utilsController;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _facebookAuth = FacebookAuth.instance;

  AuthController(
      {required this.sharedPreferences,
      required this.utilsController,
      required this.userController});

  var _googleSignIn = GoogleSignIn();

  var googleAccount = Rx<GoogleSignInAccount?>(null);

  Future<void> createAccount(
      {required String userName,
      required String password,
      required String email}) async {
    utilsController.authIsLoading.value = true;
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        final UserModel userData = UserModel(
          id: user.user!.uid.toString(),
          userName: userName,
          email: user.user!.email.toString(),
          profilePhoto: "",
          totalWorkHours: 0,
          taskCompleted: 0,
          user_id: user.user!.uid,
        );
        sharedPreferences.setString(AppConstants.userId, user.user!.uid);

        await fireStore
            .collection(AppConstants.userCollectionName)
            .doc(user.user!.uid)
            .set(
              userData.toMap(),
            )
            .then((onValue) async {
          await userController.getUser(userId: user.user!.uid).then((onValue) {
            print("Success");
            utilsController.authIsLoading.value = false;
            Get.offAllNamed(
              RouteHelpers.getMainPage(),
            );
          });
        }).catchError((onError) {
          utilsController.authIsLoading.value = false;
          if (onError is FirebaseException) {
            utilsController.showToast(onError.toString());
          } else {
            print("Something went wrong");
          }
        });
      }).catchError((onError) {
        utilsController.authIsLoading.value = false;
        if (onError is FirebaseAuthException) {
          if (onError.code == 'user-not-found') {
            utilsController.showToast('User not found');
          } else if (onError.code == 'wrong-password') {
            utilsController.showToast('Incorrect Password');
          } else if (onError.code == 'invalid-credentials') {
            utilsController.showToast('Invalid credentials');
          } else {
            utilsController.showToast('${onError.code}');
          }
        } else {
          utilsController.showToast('Something went wrong');
        }
      });
    } catch (e) {
      utilsController.authIsLoading.value = false;
      utilsController.showToast(e.toString());
    }
  }

  Future<void> loginAccount(
      {required String password, required String email}) async {
    utilsController.authIsLoading.value = true;
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        sharedPreferences.setString(AppConstants.userId, user.user!.uid);
        await userController.getUser(userId: user.user!.uid).then((onValue) {
          utilsController.authIsLoading.value = false;
          Get.offAllNamed(
            RouteHelpers.getMainPage(),
          );
        });
      }).catchError((onError) {
        utilsController.authIsLoading.value = false;
        if (onError is FirebaseAuthException) {
          if (onError.code == 'user-not-found') {
            utilsController.showToast('User not found');
          } else if (onError.code == 'wrong-password') {
            utilsController.showToast('Incorrect Password');
          } else if (onError.code == 'invalid-credentials') {
            utilsController.showToast('Invalid credentials');
          } else {
            utilsController.showToast('${onError.code}');
          }
        } else {
          utilsController.showToast("Something went wrong");
        }
      });
    } catch (e) {
      utilsController.authIsLoading.value = false;
      print(e);
      utilsController.showToast(e.toString());
    }
  }

  Future<void> loginWithGoogle() async {
    CustomDialog.showDialog();
    try {
      googleAccount.value = await _googleSignIn.signIn();
      if (googleAccount.value == null) {
        print("user doc is empty");
        CustomDialog.cancelDialog();
      } else {
        print("user doc is not empty");
        GoogleSignInAuthentication googleSignInAccount =
            await googleAccount.value!.authentication;
        OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAccount.accessToken,
          idToken: googleSignInAccount.idToken,
        );

        await _auth.signInWithCredential(oAuthCredential).then((onValue) async {
          final DocumentSnapshot userDoc = await fireStore
              .collection(AppConstants.userCollectionName)
              .doc(onValue.user!.uid)
              .get();

          if (userDoc.exists) {
            print("user doc exists");
            CustomDialog.cancelDialog();
            await userController.getUser(
              userId: onValue.user!.uid,
            );
            sharedPreferences.setString(
              AppConstants.userId,
              onValue.user!.uid,
            );
            Get.offAllNamed(
              RouteHelpers.getMainPage(),
            );
          } else {
            print("user doc does not exists");
            final UserModel userData = UserModel(
              id: onValue.user!.uid.toString(),
              userName: onValue.user!.displayName.toString(),
              email: onValue.user!.email.toString(),
              profilePhoto: onValue.user!.photoURL.toString(),
              totalWorkHours: 0,
              taskCompleted: 0,
              user_id: onValue.user!.uid.toString(),
            );
            await fireStore
                .collection(AppConstants.userCollectionName)
                .doc(onValue.user!.uid)
                .set(
                  userData.toMap(),
                )
                .then((collection) async {
              sharedPreferences.setString(
                AppConstants.userId,
                onValue.user!.uid,
              );
              await userController
                  .getUser(userId: onValue.user!.uid)
                  .then((onValue) {
                CustomDialog.cancelDialog();
                Get.offAllNamed(
                  RouteHelpers.getMainPage(),
                );
              });
            }).catchError((onError) {
              CustomDialog.cancelDialog();
              if (onError is FirebaseException) {
                utilsController.showToast(onError.toString());
              } else {
                print("Something went wrong");
              }
            });
          }
        }).catchError((onError) {
          CustomDialog.cancelDialog();
          if (onError is FirebaseAuthException) {
            utilsController.showToast(
              onError.toString(),
            );
          } else {
            print("Something went wrong");
          }
        });
      }
    } catch (e) {
      CustomDialog.cancelDialog();
      print(
        e.toString(),
      );
    }
  }

  Future<void> loginWithFacebook() async {
    CustomDialog.showDialog();
    try {
      final LoginResult loginResult = await _facebookAuth.login(
        permissions: [
          "public_profile",
          "email",
        ],
      );
      final faceBookData =await  _facebookAuth.getUserData();
      if (loginResult.isNull) {
        print("user doc is empty");
        CustomDialog.cancelDialog();
      } else {
        print("user doc is not empty");

        OAuthCredential oAuthCredential = FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );

        print("oauth" +loginResult.accessToken!.tokenString,);
        await _auth.signInWithCredential(oAuthCredential).then((onValue) async {
          final DocumentSnapshot userDoc = await fireStore
              .collection(AppConstants.userCollectionName)
              .doc(onValue.user!.uid)
              .get();

          if (userDoc.exists) {
            print("user doc exists");
            CustomDialog.cancelDialog();
            await userController.getUser(
              userId: onValue.user!.uid,
            );
            sharedPreferences.setString(
              AppConstants.userId,
              onValue.user!.uid,
            );
            Get.offAllNamed(
              RouteHelpers.getMainPage(),
            );
          } else {
            print("user doc does not exists");
            final UserModel userData = UserModel(
              id: onValue.user!.uid.toString(),
              userName: onValue.user!.displayName.toString(),
              email: onValue.user!.email.toString(),
              profilePhoto: onValue.user!.photoURL.toString() + "?access_token=${loginResult.accessToken!.tokenString}",
              totalWorkHours: 0,
              taskCompleted: 0,
              user_id: onValue.user!.uid.toString(),
            );
            await fireStore
                .collection(AppConstants.userCollectionName)
                .doc(onValue.user!.uid)
                .set(
                  userData.toMap(),
                )
                .then((collection) async {
              sharedPreferences.setString(
                AppConstants.userId,
                onValue.user!.uid,
              );
              await userController
                  .getUser(userId: onValue.user!.uid)
                  .then((onValue) {
                CustomDialog.cancelDialog();
                Get.offAllNamed(
                  RouteHelpers.getMainPage(),
                );
              });
            }).catchError((onError) {
              CustomDialog.cancelDialog();
              if (onError is FirebaseException) {
                utilsController.showToast(onError.toString());
              } else {
                print("Something went wrong");
              }
            });
          }
        }).catchError((onError) {
          CustomDialog.cancelDialog();
          if (onError is FirebaseAuthException) {
            utilsController.showToast(
              onError.toString(),
            );
            print(
              onError.toString(),
            );
          } else {
            print("Something went wrong");
          }
        });
      }
    } catch (e) {
      CustomDialog.cancelDialog();
      print(
        e.toString(),
      );
    }
  }
}
