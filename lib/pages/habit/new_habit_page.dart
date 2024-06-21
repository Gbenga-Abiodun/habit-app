import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/app_text_field.dart';
import 'package:habit_app/widgets/custom_app_bar.dart';
import 'package:habit_app/widgets/top_space.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as provider;

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class NewHabitPage extends StatelessWidget {
   NewHabitPage({Key? key}) : super(key: key);

  var navController = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Column(
        children: [
          TopSpace(),
          CustomAppBar(
            hasCircleImage: false,
            pageTitle: "New Habit",
            onTap: () {
              navController.changeToCheckMark.value = !navController.changeToCheckMark.value;
              Navigator.of(context).pop();
            },
            leadingIcon: SvgPicture.asset(
              Assets.svgsBackIcon,
              width: Dimensions.font16,
              height: Dimensions.height12,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: Dimensions.height10 * 3,),
          Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Flexible(
                             child: AppTextField(
                              hintText: "Enter habit name",
                              autoFocus: false,
                              // focusNode: utilsController.focusNode6,
                              obscureText: false,
                              fillColor: AppColors.scaffoldBg,
                              inputFontWeight: FontWeight.w500,
                              // controller: validationController.forgottenPasswordController,
                              // onSaved: (value) =>
                              // validationController.forgottenPassword = value!,
                              // validator: (value) =>
                              //     validationController.validateEmail(value!),
                              // suffix: Container(
                              //   padding: EdgeInsets.symmetric(
                              //     vertical: Dimensions.height12,
                              //     horizontal: Dimensions.height12,
                              //   ),
                              //   child: SmallText(
                              //     text: "Show",
                              //     decoration: TextDecoration.underline,
                              //     size: Dimensions.font16,
                              //     fontWeight: FontWeight.w500,
                              //     color: AppColors.eclipse,
                              //   ),
                              // ),
                              // prefix: Obx(() {
                              //   return Icon(
                              //     Icons.mail_outline_rounded,
                              //     size: Dimensions.height12 * 2,
                              //     color: utilsController.isFocused6.value
                              //         ? AppColors.textInputColor
                              //         : AppColors.eclipse.withOpacity(0.5),
                              //   );
                              // }),
                                           ),
                           ),
                          Container(
                            width: Dimensions.height12 * 4,
                            height: Dimensions.height10 * 5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: Dimensions.height10 * 2,),
                            decoration : BoxDecoration(
                              color: AppColors.scaffoldBg,
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.height12),
                              ),
                            ),
                            child: SvgPicture.asset(
                              Assets.svgsSolidbookreader,
                              color: AppColors.eclipse,
                              width: Dimensions.height12 * 2.916666666666667,
                              height: Dimensions.height12 * 2.916666666666667,
                              fit: BoxFit.scaleDown,
                            ),

                          )
                        ],
                      ),
                      Positioned(
                        bottom: Dimensions.height12 * 3,
                        right: Dimensions.height12 * 1.416666666666667,
                        child: SvgPicture.asset(
                          Assets.svgsCircleplusfill,
                          // color: AppColors.morning,
                          width: Dimensions.height10 * 2,
                          height: Dimensions.height10 * 2,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height8,),
              Container(
                height: Dimensions.height12 * 11.08333333333333,
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10 * 2,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBg,
                  borderRadius: BorderRadius.circular(12,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
