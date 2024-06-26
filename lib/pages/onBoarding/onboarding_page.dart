import 'package:flutter/gestures.dart';
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
            controller: onBoardingController.pageController,
            onPageChanged: onBoardingController.selectedPageIndex,
            itemCount: onBoardingController.onBoardingList.length,
            itemBuilder: (context, index) {
              return Container(
                // margin: EdgeInsets.symmetric(horizontal: 32,),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Dimensions.height10 * 8,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height10,),
                      child: BigText(
                        textAlign: TextAlign.center,
                        text: onBoardingController.onBoardingList[index].title,
                        color: AppColors.eclipse,
                        size: Dimensions.height12 * 2.666666666666667,
                        fontFamily: "Klasik",
                      ),
                    ),

                    if(index != 0 )
                      SizedBox(height: Dimensions.height12 * 3.5,),
                   SvgPicture.asset(
                      onBoardingController.onBoardingList[index].svgAsset,
                      width: onBoardingController.onBoardingList[index]
                          .imgWidth,
                      height: onBoardingController.onBoardingList[index]
                          .imgHeight,
                      fit: BoxFit.scaleDown,),
                    SizedBox(height: index != 0
                        ? Dimensions.height12 * 5.5
                        : Dimensions.height10 * 2),

                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: Dimensions.height12 * 4,
            left: Dimensions.height12 * 2.75,
            right: Dimensions.height12 * 2.75,
            child: Container(
              // margin:
              child: Column(
                children: [
                  // SizedBox(height: 66,),

                  RichText(
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
                  SizedBox(height: Dimensions.height15 * 4,),
                  Container(
                    width: MediaQuery.of(context).size.width,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        GestureDetector(
                          onTap: () => onBoardingController.goToSupportive(),
                          child: SmallText(
                            text: "Skip", fontWeight: FontWeight.bold, size: Dimensions.font17,),
                        ),
                        // Spacer(),
                        // SizedBox(width: Dimensions.height10 * 10,),
                        // Spacer(),
                        Container(
                          width: Dimensions.height10 * 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: List.generate(
                              onBoardingController.onBoardingList.length, (
                                index) {
                              return Obx(() {
                                return Container(
                                  width: Dimensions.height13,

                                  height:  Dimensions.height13,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      onBoardingController
                                          .selectedPageIndex.value == index
                                          ? BoxShadow(
                                      color: Color(0xFF573353),
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                )
                                          : BoxShadow(
                                        color: Colors.transparent,
                                        blurRadius: 0,
                                        offset: Offset(0, 0),
                                      )

                                    ],
                                    // border: Border.all(
                                    //   width: 1,
                                    //   color:
                                    // ),
                                    color: onBoardingController
                                        .selectedPageIndex.value == index
                                        ? Color(0xFF573353)
                                        : AppColors.morning,
                                    shape: BoxShape.circle,
                                  ),
                                );
                              });
                            },),
                          ),
                        ),
                        // Spacer(),

                        // SizedBox(width: Dimensions.height10 * 10,),
                        // Spacer(),
                        GestureDetector(
                          onTap: () => onBoardingController.forwardAction(),
                          child: SmallText(
                            text: "Next", fontWeight: FontWeight.bold, size:  Dimensions.font17,),
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                  // SizedBox(height: 108,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
