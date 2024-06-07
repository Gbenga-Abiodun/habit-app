import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsController extends GetxController{
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  var isFocused1 = false.obs;
  var isFocused2 = false.obs;
  var isFocused3 = false.obs;

  var isFocused4 = false.obs;

  var isFocused5 = false.obs;

  var isFocused6 = false.obs;

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    focusNode1.addListener(_onFocusedChanged1);
    focusNode2.addListener(_onFocusedChanged2);
    focusNode3.addListener(_onFocusedChanged3);
    focusNode4.addListener(_onFocusedChanged4);
    focusNode5.addListener(_onFocusedChanged5);
    focusNode5.addListener(_onFocusedChanged6);
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
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
  }  void _onFocusedChanged4() {
    isFocused4.value = focusNode4.hasFocus;
  }  void _onFocusedChanged5() {
    isFocused5.value = focusNode5.hasFocus;
  }void _onFocusedChanged6() {
    isFocused6.value = focusNode6.hasFocus;
  }
}