import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class MyTime extends GetView<UtilsController> {

  final int minutes;

  final int wheelSelectedIndex;


  const MyTime({Key? key, required this.minutes, required this.wheelSelectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SmallText(
        text: minutes < 10 ? "0" + minutes.toString() : minutes.toString(),
        fontWeight: FontWeight.w700,
        size: wheelSelectedIndex == minutes ? Dimensions.height12 * 2.666666666666667 : Dimensions.height11 * 2,
        color: wheelSelectedIndex == minutes ? AppColors.eclipse : AppColors.eclipse.withOpacity(0.45),
      ),
    );
  }
}
