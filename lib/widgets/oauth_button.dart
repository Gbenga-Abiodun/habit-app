import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../generated/assets.dart';
import '../utils/dimensions.dart';

class OauthButton extends StatelessWidget {

  final String text;
  final String svgPath;
  const OauthButton({Key? key, required this.text, required this.svgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: Dimensions.height10 * 18,
        height: Dimensions.height10 * 5,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.height12),),

        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: SvgPicture.asset(svgPath, width: Dimensions.height12 * 2.333333333333333, height: Dimensions.height12 * 2.333333333333333, fit: BoxFit.scaleDown,)),
              SizedBox(width: Dimensions.font16,),
              SmallText(text: text, color: AppColors.eclipse, fontWeight: FontWeight.bold,size: Dimensions.font16,),
            ],
          ),
        ),
      ),
    );
  }
}
