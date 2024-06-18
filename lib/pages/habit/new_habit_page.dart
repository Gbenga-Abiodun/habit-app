import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/custom_app_bar.dart';
import 'package:habit_app/widgets/top_space.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class NewHabitPage extends StatelessWidget {
   NewHabitPage({Key? key}) : super(key: key);

  var navController = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Column(
        children: [
          TopSpace(),
          CustomAppBar(
            hasCircleImage: false,
            pageTitle: "New Habit",
            onTap: () {
              navController.changeToCheckMark.value = !navController.changeToCheckMark.value;
              Navigator.of(context).pop();
            },
            leadingIcon: SvgPicture.asset(
              Assets.svgsBackIcon,
              width: Dimensions.font16,
              height: Dimensions.height12,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}
