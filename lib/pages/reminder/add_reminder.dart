import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/routes/route_keys.dart';
import 'package:habit_app/widgets/custom_button.dart';
import 'package:habit_app/widgets/my_time.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';
import 'package:habit_app/widgets/wheels.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class AddReminder extends GetView<UtilsController> {
  const AddReminder({super.key});

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      // height: Dimensions.height10 * 70,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Dimensions.height12,
        ),
      ),
      child: Column(
        children: [
          // Spacer(),
          Column(
            children: [
              SizedBox(
                height: Dimensions.font16,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10 * 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(
                        id: RouteKeys.reminderKey,
                      ),
                      child: SmallText(
                        text: "Cancel",
                        fontWeight: FontWeight.w800,
                        size: Dimensions.font17,
                        color: AppColors.textInputColor,
                      ),
                    ),
                    SmallText(
                      text: "Add Reminders",
                      fontWeight: FontWeight.w800,
                      size: Dimensions.font18,
                      color: AppColors.eclipse,
                    ),
                    SmallText(
                      text: "Save",
                      fontWeight: FontWeight.w800,
                      size: Dimensions.font17,
                      color: AppColors.textInputColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.font16,
              ),
              Divider(
                color: AppColors.scaffoldBg2,
              ),
              SizedBox(
                height: Dimensions.height10 * 4,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10 * 9,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomHourWheel(),
                        ),
                        SmallText(
                          text: ":",
                          fontWeight: FontWeight.w800,
                          size: Dimensions.height12 * 2.666666666666667,
                          color: AppColors.eclipse,
                        ),
                        Expanded(
                          child: CustomMinutesWheel(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Flexible(
                child: Obx(() {
                  return WheelsButton(
                    title: "am",
                    textColor: controller.isAntiMeridiem.isFalse
                        ? AppColors.eclipse
                        : AppColors.textInputColor,
                    containerColor: controller.isAntiMeridiem.isFalse
                        ? AppColors.textInputColor
                        : AppColors.scaffoldBg2,
                    onTap: () {
                      controller.isAntiMeridiem.value =
                          !controller.isAntiMeridiem.value;
                    },
                  );
                }),
              ),
              Flexible(child: Obx(() {
                return WheelsButton(
                  title: "pm",
                  textColor: controller.isAntiMeridiem.isTrue
                      ? AppColors.eclipse
                      : AppColors.textInputColor,
                  containerColor: controller.isAntiMeridiem.isTrue
                      ? AppColors.textInputColor
                      : AppColors.scaffoldBg2,
                  onTap: () {
                    controller.isAntiMeridiem.value = true;
                  },
                );
              })),
            ],
          )
        ],
      ),
    );
  }
}
