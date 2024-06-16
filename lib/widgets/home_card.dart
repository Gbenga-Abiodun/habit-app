import 'package:flutter/material.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/utils/dimensions.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../generated/assets.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height12 * 12.16666666666667,
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
              left: Dimensions.height15,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height12 * 2.166666666666667,
                    ),
                    SmallText(
                      text:
                          "We first make our habits, \nand then our habits \nmakes us.",
                      fontFamily: "Klasik",
                      size: Dimensions.font18,
                      color: AppColors.eclipse,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmallText(
                      text: "- anonymous".toUpperCase(),
                      // fontFamily: "Klasik",
                      size: Dimensions.height12,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      color: AppColors.eclipse.withOpacity(0.5),
                    ),
                  ],
                ),

                // SizedBox(
                //   height: Dimensions.height12 * 2.166666666666667,
                // ),

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
            height: Dimensions.height10 * 50,
            width: Dimensions.height10 * 10,
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
