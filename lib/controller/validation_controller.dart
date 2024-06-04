import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationController extends GetxController{
  var allowSignIn = false.obs;
  var allowEmailAndPricing = false.obs;


  final GlobalKey<FormState> signInFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetFormStateKey = GlobalKey<FormState>();



  void checkAllowSignIn(){
    allowSignIn.value = !allowSignIn.value;
  }
  void checkAllowEmailAndPricing(){
    allowEmailAndPricing.value = !allowEmailAndPricing.value;
  }
}