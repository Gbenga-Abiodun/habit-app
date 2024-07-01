import 'package:flutter/material.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../config/themes/gradient.dart';
import '../generated/assets.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height12 * 12.16666666666667,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.height12,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.imagesCoursesCard,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: Dimensions.height12 * 12.16666666666667,

            decoration: BoxDecoration(
              gradient: courseCardGradient,
              borderRadius: BorderRadius.circular(
                Dimensions.height12,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.height15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.font12,
                    ),
                    SmallText(
                      text: "Habit \ncourses",
                      fontFamily: "Klasik",
                      size: Dimensions.font12 * 3,
                      color: AppColors.eclipse,
                      height: 1.1,
                    ),
                    // SizedBox(height: Dimensions.height8/2,),
                    Row(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SmallText(
                          text:
                              "Find what fascinates you as you \nexplore these habit courses.",
                          // fontFamily: "Klasik",
                          size: Dimensions.height12,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                          color: AppColors.eclipse,
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
            ],
          ),
        ],
      ),
    );
  }
}
