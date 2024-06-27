import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/utils_controller.dart';
import '../utils/dimensions.dart';
import 'my_time.dart';

class CustomMinutesWheel extends GetView<UtilsController> {
  const CustomMinutesWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 22,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.003,
        physics: FixedExtentScrollPhysics(),
        controller: controller.scrollController,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 60,
          builder: (context, index) {
            return MyTime(minutes: index);
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
      height: Dimensions.height10 * 22,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.003,
        physics: FixedExtentScrollPhysics(),
        controller: controller.scrollController,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 60,
          builder: (context, index) {
            return MyTime(minutes: index);
          },
        ),
      ),
    );
  }
}

