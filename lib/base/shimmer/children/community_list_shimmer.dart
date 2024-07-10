import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/small_text.dart';
import '../base/base_shimmer.dart';

class CommunityListShimmer extends StatelessWidget {
  const CommunityListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var commentUserIcon = Padding(
      padding: EdgeInsets.only(
        left: Dimensions.font16,
        right: Dimensions.height10,
      ),
      child: Container(
        // height: Dimensions.height10 * 18,
        margin: EdgeInsets.only(
          bottom: Dimensions.height12,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: Dimensions.height12 * 2.333333333333333,
                  height: Dimensions.height12 * 2.333333333333333,
                  decoration: BoxDecoration(
                    color: AppColors.eclipse.withOpacity(
                      0.2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: Dimensions.height10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimensions.height14,
                      width: Dimensions.height10 * 5,
                      color: AppColors.eclipse.withOpacity(
                        0.2,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height8,
                    ),
                    Container(
                      height: Dimensions.height14,
                      width: Dimensions.height11 * 4,
                      color: AppColors.eclipse.withOpacity(
                        0.2,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: Dimensions.height12 * 2.666666666666667,
              height: Dimensions.height12 * 2.666666666666667,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.eclipse.withOpacity(
                  0.2,
                ),
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );

    var contentCommentShimmer = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.font16,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        color: AppColors.eclipse.withOpacity(
          0.2,
        ),
        height: Dimensions.height10 * 4,
      ),
    );

    var commentSideShimmer = Padding(
      padding:  EdgeInsets.only(
        bottom:Dimensions.height12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              right: Dimensions.font16,
            ),
            color: AppColors.eclipse.withOpacity(
              0.2,
            ),
            child: SizedBox(
              width: Dimensions.height12 * 5.583333333333333,
              height: Dimensions.height11,
            ),
          ),
        ],
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: Dimensions.height10 * 17,
      margin: EdgeInsets.only(
        bottom: Dimensions.height12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Dimensions.height12,
        ),
      ),
      child: Column(
        children: [
          BaseShimmer(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height10,
                ),
                commentUserIcon,
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height8 / 2 / 2,
          ),
          Divider(
            color: AppColors.scaffoldBg2,
          ),
          BaseShimmer(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.font10,
                ),
                contentCommentShimmer,
                SizedBox(
                  height: Dimensions.font10,
                ),
                commentSideShimmer,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
