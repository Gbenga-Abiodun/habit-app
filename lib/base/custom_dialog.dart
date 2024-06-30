import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/generated/assets.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/utils/dimensions.dart';
import 'package:habit_app/widgets/small_text.dart';

class CustomDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () => Future.value(false),
        child: Material(
          color: Colors.transparent,
          child: Center(
            // Center the entire content
            child: Container(
              width: MediaQuery.of(Get.context!).size.width,
              height: Dimensions.height10 * 8,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.height10 * 2,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height10 * 3,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Dimensions.height12,
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimensions.height10 * 4,
                    height: Dimensions.height10 * 4,
                    child: CircularProgressIndicator(
                      color: AppColors.textInputColor,
                    ),
                  ),
                  SmallText(
                    text: "Signing In",
                    size: Dimensions.font18,
                    color: AppColors.eclipse,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(
                    width: Dimensions.height10 * 4,
                    height: Dimensions.height10 * 4,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black54,
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
