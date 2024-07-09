import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../base/main_shimmer.dart';

class CommunityListShimmer extends StatelessWidget {
  const CommunityListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Dimensions.height10 * 16,
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
          SizedBox(
            height: Dimensions.height10,
          ),
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.font16,
              right: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainShimmer(
                  child: Container(
                    width: Dimensions.height12 * 7.25,
                    height: Dimensions.height12 * 7.25,
                  ),
                ),
                MainShimmer(
                  child: Container(
                    width: Dimensions.height12 * 2.666666666666667,
                    height: Dimensions.height12 * 2.666666666666667,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height8 / 2,
          ),
          Divider(
            color: AppColors.scaffoldBg2,
          ),
          SizedBox(
            height: Dimensions.font10,
          ),
          MainShimmer(
            child: Container(
              height: Dimensions.height10 * 6,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.font16,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height12,
          ),
          MainShimmer(
            child: Container(
              margin: EdgeInsets.only(
                right: Dimensions.font16,
              ),
              height: Dimensions.height11,
            ),
          )
        ],
      ),
    );
  }
}
