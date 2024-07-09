import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../controller/utils_controller.dart';
import '../utils/dimensions.dart';
import 'my_time.dart';

class CustomMinutesWheel extends GetView<UtilsController> {
  const CustomMinutesWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 23,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.005,
        physics: FixedExtentScrollPhysics(),
        controller: controller.scrollControllerMinutes,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 60,
          builder: (context, index) {
            return Obx(() {
              return MyTime(
                minutes: index,
                wheelSelectedIndex: controller.wheelSelectedIndexMinute.value,
              );
            });
          },
        ),
      ),
    );
  }
}

class CustomHourWheel extends GetView<UtilsController> {
  const CustomHourWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 23,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.005,

        physics: FixedExtentScrollPhysics(),
        controller: controller.scrollControllerHour,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 60,

          builder: (context, index) {
            return Obx(() {
              return MyTime(
                minutes: index,
                wheelSelectedIndex: controller.wheelSelectedIndexHour.value,
              );
            });
          },
        ),
      ),
    );
  }
}

class WheelsButton extends GetView<UtilsController> {
  final String title;

  final void Function()? onTap;

  final Color? textColor;
  final Color? containerColor;

  const WheelsButton({super.key, required this.title, this.onTap, this.textColor = const Color(0xFF573353), this.containerColor = const Color(0xFFFDA758),});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimensions.height10 * 6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:containerColor,
        ),
        child: SmallText(
          text: title,
          size: Dimensions.height11 * 2,
          fontWeight: FontWeight.w700,
          color: textColor,
          fontFamily: "Manrope",
        ),
      ),
    );
  }
}
