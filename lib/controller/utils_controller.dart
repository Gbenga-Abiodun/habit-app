import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../generated/assets.dart';
import '../utils/dimensions.dart';

class UtilsController extends GetxController {

  var authIsLoading = false.obs;
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
  final toast = FToast();

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    toast.init(Get.context!);
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
  }

  void _onFocusedChanged4() {
    isFocused4.value = focusNode4.hasFocus;
  }

  void _onFocusedChanged5() {
    isFocused5.value = focusNode5.hasFocus;
  }

  void _onFocusedChanged6() {
    isFocused6.value = focusNode6.hasFocus;
  }

  void showToast(String text) {
    return toast.showToast(
      child: BuildToast(Get.context!, text),
    );
  }

  Widget BuildToast(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height12,
        horizontal: Dimensions.height10 * 2,
      ),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(Dimensions.height12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Dimensions.height10 * 2,
            height: Dimensions.height10 * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Assets.imagesOnboardingOneAvatar),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          SmallText(
            text: text,
            fontWeight: FontWeight.w500,
            size: Dimensions.height12,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
