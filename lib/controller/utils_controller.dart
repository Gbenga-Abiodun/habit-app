import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsController extends GetxController{
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  var isFocused1 = false.obs;
  var isFocused2 = false.obs;
  var isFocused3 = false.obs;

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    focusNode1.addListener(_onFocusedChanged1);
    focusNode2.addListener(_onFocusedChanged2);
    focusNode3.addListener(_onFocusedChanged3);
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  void _onFocusedChanged1() {
    isFocused1.value = focusNode1.hasFocus;
  }

  void _onFocusedChanged2() {
    isFocused2.value = focusNode2.hasFocus;
  }

  void _onFocusedChanged3() {
    isFocused3.value = focusNode3.hasFocus;
  }
}