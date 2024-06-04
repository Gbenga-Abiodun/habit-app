import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class ForgottenPasswordPage extends StatelessWidget {
  const ForgottenPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: AppScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height10 * 2,
          ),
          child: Column(
            children: [
              SizedBox(height: Dimensions.height10 * 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleIcon(
                    onTap: () => Get.back(),

                    child: SvgPicture.asset(
                      Assets.svgsBackIcon,
                      width: Dimensions.font16,
                      height: Dimensions.height12,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height12 * 2.333333333333333,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(text: "Forgot your password?".toUpperCase(), size: Dimensions.height12 * 2, fontFamily: "Klasik",)
                ],
              ),
              SizedBox(height: Dimensions.height10 * 3,),
             SvgPicture.asset(
               Assets.svgsReset,
               fit: BoxFit.scaleDown,
               width: MediaQuery.of(context).size.width,
               height: Dimensions.height12 * 23.66666666666667,
             )


            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: Dimensions.height10 * 37,
        color: AppColors.scaffoldBg2,
        child: Column(
          children: [
            Container(
              width: Dimensions.height12 * 31,
              height: Dimensions.height10 * 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.borderRadius12,),
              ),
            ),
            SizedBox(
              height: Dimensions.height10 * 10,
            )
          ],
        ),
      ),
    );
  }
}
