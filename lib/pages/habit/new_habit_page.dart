import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/controller/validation_controller.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/app_text_field.dart';
import 'package:habit_app/widgets/custom_app_bar.dart';
import 'package:habit_app/widgets/custom_list_tile.dart';
import 'package:habit_app/widgets/custom_switch.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/top_space.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as provider;

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';
import '../../widgets/small_text.dart';

class NewHabitPage extends StatelessWidget {
  NewHabitPage({Key? key}) : super(key: key);

  var navController = Get.find<NavController>();
  var validationController = Get.find<ValidationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: AppScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            TopSpace(),
            CustomAppBar(
              hasCircleImage: false,
              pageTitle: "New Habit",
              onTap: () {
                navController.changeToCheckMark.value =
                    !navController.changeToCheckMark.value;
                Navigator.of(context).pop();
              },
              leadingIcon: SvgPicture.asset(
                Assets.svgsBackIcon,
                width: Dimensions.font16,
                height: Dimensions.height12,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: Dimensions.height10 * 3,
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: Dimensions.height10 * 88,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: provider.Svg(
                        Assets.svgsBg2,
                      ),
                    ),
                  ),
                ),
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
                                  margin: EdgeInsets.only(
                                    right: Dimensions.height10 * 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.scaffoldBg,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.height12),
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.svgsSolidbookreader,
                                    color: AppColors.eclipse,
                                    width:
                                        Dimensions.height12 * 2.916666666666667,
                                    height:
                                        Dimensions.height12 * 2.916666666666667,
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
                    SizedBox(
                      height: Dimensions.height8,
                    ),
                    Container(
                      height: Dimensions.height12 * 11.08333333333333,
                      margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.height10 * 2,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBg,
                        borderRadius: BorderRadius.circular(
                          Dimensions.font12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height8,
                    ),
                    NormalListTileWidget(
                      NormalListTileTitle: "Reminder",
                      NormalListTileTrailing: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: "10:00AM",
                            size: Dimensions.font16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textInputColor,
                          ),
                          SizedBox(
                            width: Dimensions.height10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.textInputColor,
                            size: Dimensions.font16,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height8,
                    ),
                    Obx(() {
                      return NormalListTileWidget(
                        NormalListTileTitle: "Notification",
                        NormalListTileTrailing: CustomSwitch(
                          value: validationController.allowNotification.value,
                          onChanged: (value) {
                            validationController.allowNotification.value =
                                value;
                          },
                        ),
                      );
                    }),
                    SizedBox(
                      height: Dimensions.height12 * 6.7,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: Dimensions.height12 * 18.08333333333333,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height10 * 2,
                      ),
                      color: Colors.transparent,
                      child: Container(
                        height: Dimensions.height12 * 15.16666666666667,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.scaffoldBg,
                          borderRadius: BorderRadius.circular(
                            Dimensions.height12,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Dimensions.height10 * 5,
                            ),
                            SmallText(
                              text: "Start this habit",
                              size: Dimensions.height12 * 2,
                              fontFamily: "Klasik",
                              color: AppColors.eclipse,
                            ),
                            SmallText(
                              text:
                                  "ullamco laboris nisi ut aliquip ex ea commodo \n                              consequat dolore. ",
                              size: Dimensions.height14,
                              color: AppColors.eclipse.withOpacity(
                                0.5,
                              ),
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: Dimensions.font17,
                            ),
                            SvgPicture.asset(
                              Assets.svgsStart,
                              width: Dimensions.height8* 2.375,
                              height: Dimensions.height8* 3.125,
                              fit: BoxFit.scaleDown,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  // : ,
                  top: Dimensions.height10 * 37,
                  left: Dimensions.height12 * 14.33333333333333,
                  right: Dimensions.height12 * 14.33333333333333,
                  child: Container(
                    width: Dimensions.height10 * 7,
                    height: Dimensions.height10 * 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.imagesOnboardingOneAvatar),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
