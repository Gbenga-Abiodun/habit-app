import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class MyTime extends GetView<UtilsController> {

  final int minutes;


  const MyTime({Key? key, required this.minutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        alignment: Alignment.center,
        child: SmallText(
          text: minutes < 10 ? "0" + minutes.toString() : minutes.toString(),
          fontWeight: FontWeight.w800,
          size: controller.wheelSelectedIndex.value == minutes ? Dimensions.height12 * 2.666666666666667 : Dimensions.height11 * 2,
          color: controller.wheelSelectedIndex.value == minutes ? AppColors.eclipse : AppColors.eclipse.withOpacity(0.45),
        ),
      );
    });
  }
}
