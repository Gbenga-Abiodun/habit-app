import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/onboarding_controller.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/big_text.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  var onBoardingController = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onBoardingController.onBoardingList.length,
            itemBuilder: (context, index) {
              return Container(
                // margin: EdgeInsets.symmetric(horizontal: 32,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.height10,),
                      child: BigText(
                        textAlign: TextAlign.center,
                        text: onBoardingController.onBoardingList[index].title,
                        color: AppColors.eclipse,
                        size: Dimensions.height10 * 4,
                        fontFamily: "Klasik",
                      ),
                    ),

                    if(index != 0 )
                      SizedBox(height: Dimensions.height12 *3.5,),
                    index != 0 ? SvgPicture.asset(onBoardingController.onBoardingList[index].svgAsset, width: onBoardingController.onBoardingList[index].imgWidth, height: onBoardingController.onBoardingList[index].imgHeight, fit: BoxFit.scaleDown,) : Image.asset(onBoardingController.onBoardingList[0].svgAsset, width: onBoardingController.onBoardingList[0].imgWidth, height: onBoardingController.onBoardingList[0].imgHeight, fit: BoxFit.scaleDown,),
                    SizedBox(height: index !=0 ? 66 : Dimensions.height10 * 2),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Dimensions.height12 *2.666666666666667 ,),
                      child: SmallText(text: onBoardingController.onBoardingList[index].description, size: 17, fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
                    )
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                     SmallText(text: "Skip", fontWeight: FontWeight.bold, size: 17,),
                    Row(
                      children:  List.generate(onBoardingController.onBoardingList.length, (index) {
                        return Container(
                          width: 13,

                          height: 13,
                          decoration: BoxDecoration(
                            color: AppColors.morning,
                            shape: BoxShape.circle,
                          ),
                        );
                      },),
                    ),
                     SmallText(text: "Next", fontWeight: FontWeight.bold, size: 17,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
