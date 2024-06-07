import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationController extends GetxController {
  var allowSignIn = false.obs;
  var allowEmailAndPricing = false.obs;


  var isPasswordHidden = true.obs;

  final GlobalKey<FormState> signInFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetFormStateKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      passwordController,
      nameController,
      loginPasswordController,
      loginEmailController,
      forgottenPasswordController;

  var email = "".trim();
  var password = "".trim();
  var name = "".trim();
  var loginEmail = "".trim();
  var loginPassword = "".trim();
  var forgottenPassword = "".trim();

  @override
  void onInit() {
    _initFormControllers();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _disposeFormControllers();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be greater than 8 characters";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name cannot be Empty";
    }
    return null;
  }
  // String? validateName(String value) {
  //   if (value.isEmpty) {
  //     return "Name cannot be Empty";
  //   }
  //   return null;
  // }
  // String? validateName(String value) {
  //   if (value.isEmpty) {
  //     return "Name cannot be Empty";
  //   }
  //   return null;
  // }

  void _initFormControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    forgottenPasswordController = TextEditingController();
    nameController = TextEditingController();
    loginPasswordController = TextEditingController();
    loginEmailController = TextEditingController();
  }

  void _disposeFormControllers() {
    emailController.dispose();
    passwordController.dispose();
    forgottenPasswordController.dispose();
    nameController.dispose();
    loginPasswordController.dispose();
    loginEmailController.dispose();

    // passwordController = TextEditingController();
  }

  void checkAllowSignIn() {
    allowSignIn.value = !allowSignIn.value;
  }

  void checkAllowEmailAndPricing() {
    allowEmailAndPricing.value = !allowEmailAndPricing.value;
  }
}
