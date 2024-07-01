import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/user_controller.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../generated/assets.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CustomSettingsCard extends StatelessWidget {
   CustomSettingsCard({Key? key}) : super(key: key);

  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height12 *12.16666666666667,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBg,
        borderRadius: BorderRadius.circular(
          Dimensions.height12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.height11 * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height12 * 2.166666666666667,
                ),
                SmallText(
                  text:
                  "Check Your Profile",
                  fontWeight: FontWeight.w800,

                  size: Dimensions.height10 * 2,
                  color: AppColors.eclipse,
                ),
                // SizedBox(height: Dimensions.height8/2,),
                SmallText(
                  text: userController.userModel!.email,
                  // fontFamily: "Klasik",
                  size: Dimensions.height12,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                  color: AppColors.eclipse.withOpacity(0.5),
                ),

                SizedBox(
                  height: Dimensions.height11 * 2,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //
                //   ],
                // ),
              ],
            ),
          ),
          Container(
            height: Dimensions.height10 * 100,
            width: Dimensions.height10 * 11,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.imagesGirl,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
