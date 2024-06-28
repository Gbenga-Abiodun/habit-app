import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/reminder/add_reminder.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/routes/route_keys.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/utils/dimensions.dart';
import 'package:habit_app/widgets/custom_button.dart';
import 'package:habit_app/widgets/custom_switch.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../generated/assets.dart';

class ReminderPage extends GetView<NavController> {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints.tight(
        Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * .7,
        ),
      ),
      // height: Dimensions.height10 * 70,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Dimensions.height12,
        ),
      ),
      child: AppScrollView(
        child: Column(
          children: [
            Container(
              height: Dimensions.height12 * 33,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: Dimensions.height12 * 7.666666666666667,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      right: Dimensions.height10,
                      bottom: Dimensions.height10,
                      top: Dimensions.font16,
                    ),
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? AppColors.fadedEclipse
                          : AppColors.scaffoldBg2,
                      borderRadius: BorderRadius.circular(
                        Dimensions.height12,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(height: Dimensions.height10,),
                        SmallText(
                          text: "06:00 AM",
                          fontWeight: FontWeight.w800,
                          color:  index.isEven
                              ? AppColors.eclipse
                              : AppColors.textInputColor,
                          size: Dimensions.height10 * 2,
                          textAlign: TextAlign.center,
                        ),
                        CustomSwitch(
                          value: true,
                          onChanged: (value) {},
                          isOrange: index.isEven ? false : true,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: Dimensions.height10 * 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: Dimensions.font16,
                      ),
                      child: CustomButton(
                        onTap: () => Get.toNamed(
                          RouteHelpers.getAddReminderPage(),
                          id: RouteKeys.reminderKey,
                        ),

                        // buttonColor: AppColors.textInputColor,
                        text: "Add Reminder",
                        textColor: AppColors.eclipse,
                      ),
                    ),
                  ),
                  Container(
                    width: Dimensions.height10 * 6,
                    height: Dimensions.height10 * 6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.height8,
                        ),
                        border: Border.all(
                          width: 2,
                          color: AppColors.eclipse.withOpacity(
                            0.3,
                          ),
                        )),
                    child: SvgPicture.asset(
                      Assets.svgsBellMute,
                      color: AppColors.eclipse.withOpacity(
                        0.3,
                      ),
                      fit: BoxFit.scaleDown,
                      width: Dimensions.height10 * 2,
                      height: Dimensions.height12 * Dimensions.height10 * 2,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
