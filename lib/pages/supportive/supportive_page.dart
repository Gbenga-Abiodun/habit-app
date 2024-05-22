import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/custom_button.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class SupportivePage extends StatelessWidget {
  const SupportivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height10 * 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10,
            ),
            child: BigText(
              textAlign: TextAlign.center,
              text: "JOIN A SUPPORTIVE \nCOMMUNITY",
              color: AppColors.eclipse,
              size: Dimensions.height10 * 4,
              fontFamily: "Klasik",
            ),
          ),
          SizedBox(
            height: Dimensions.height12 * 6.416666666666667,
          ),
          SvgPicture.asset(
            Assets.svgsSupportive,
            fit: BoxFit.scaleDown,
            width: Dimensions.height12 * 34.75,
            height: Dimensions.height12 * 25.75,
          ),
          SizedBox(
            height: Dimensions.height12 * 7.916666666666667,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height12 * 2.666666666666667,
            ),
            child: RichText(
              text: TextSpan(
                // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "We can ".toUpperCase(),
                style: TextStyle(
                  fontSize: Dimensions.font17,
                  color: AppColors.eclipse,
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     Get.back();
                    //   },
                    text: 'help you'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font17,
                      color: AppColors.morning,
                      fontFamily: "Manrope",
                    ),
                  ),
                  TextSpan(
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     Get.back();
                    //   },
                    text: ' to be a better '.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font17,
                      color: AppColors.eclipse,
                      fontFamily: "Manrope",
                    ),
                  ),
                  TextSpan(
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     Get.back();
                    //   },
                    text: '\n             version of '.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font17,
                      color: AppColors.eclipse,
                      fontFamily: "Manrope",
                    ),
                  ),
                  TextSpan(
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     Get.back();
                    //   },
                    text: 'yourself.'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font17,
                      color: AppColors.morning,
                      fontFamily: "Manrope",
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10 * 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2),
            child: CustomButton(text: "Get Started", textColor: AppColors.eclipse,),
          )
        ],
      ),
    );
  }
}
