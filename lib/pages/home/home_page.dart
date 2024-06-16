import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:habit_app/generated/assets.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/home_card.dart';
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
            height: Dimensions.height10 * 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10 * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIcon(
                  child: Icon(
                    Icons.menu_outlined,
                    color: AppColors.eclipse,
                    size: Dimensions.height11 * 2,
                  ),
                ),
                SmallText(
                  text: "Homepage",
                  fontWeight: FontWeight.w700,
                  color: AppColors.eclipse,
                  size: Dimensions.font18,
                ),
                Container(
                  width: Dimensions.height11 * 4,
                  height: Dimensions.height11 * 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        "https://images.unsplash.com/photo-1623184663110-89ba5b565eb6?q=80&w=2012&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height12 * 2,
          ),
          HomeCard(),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: Dimensions.height10 * 53,
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
