import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/generated/assets.dart';
import 'package:habit_app/utils/dimensions.dart';
class CustomDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () => Future.value(false),
        child: Center(  // Center the entire content
          child: Container(
            alignment: Alignment.center,
            // child: Lottie.asset(
            //   Assets.lottiesLoadingIndicator,
            //   repeat: true,
            //   animate: true,
            //   alignment: Alignment.center,
            //   // Adjust speed here
            //   frameRate: FrameRate(100),  // Increase the frame rate to speed up the animation
            // ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
