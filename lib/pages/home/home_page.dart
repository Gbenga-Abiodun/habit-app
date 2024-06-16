import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:habit_app/generated/assets.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Column(
        children: [
          // SizedBox(
          //   height: 330,
          // ),
          SizedBox(
            height: Dimensions.height10 * 4,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10 * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleIcon(
                  child: Icon(
                    Icons.menu_outlined,
                    color: AppColors.eclipse,
                  ),
                ),
                SmallText(
                  text: "Homepage",
                  fontWeight: FontWeight.w700,
                  color: AppColors.eclipse,
                  size: Dimensions.font18,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 543.14,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: Svg(
                  Assets.svgsBg2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
