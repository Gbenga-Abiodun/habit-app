import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/utils/dimensions.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? buttonColor;


  final Color? textColor;

  final String? fontFamily;

  final String text;

  CustomButton({Key? key, this.onTap, this.buttonColor = const Color(
      0xFFFFBA7C), required this.text, this.textColor = const Color(
      0xFF573353), this.fontFamily = "Manrope",}) : super(key: key);

  var utilsController = Get.find<UtilsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: !utilsController.authIsLoading.value ? onTap : null,
        child: Container(
          height: Dimensions.height10 * 6,
          decoration: BoxDecoration(
            color: !utilsController.authIsLoading.value ? buttonColor :  Color(
                0xFFFFBA7C).withOpacity(0.7,),
            borderRadius: BorderRadius.all(
              Radius.circular(Dimensions.height8),),

          ),
          child: Center(
              child: !utilsController.authIsLoading.value ? SmallText(
                text: text,
                color: textColor,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamily,
                size: Dimensions.font16,) : Container(
                width: Dimensions.height10 * 4,
                height: Dimensions.height10 * 4,
                  child: CircularProgressIndicator(
                  color: Colors.white,

                                ),
                )
          ),
        ),
      );
    });
  }
}
