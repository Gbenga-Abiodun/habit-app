import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/routes/route_keys.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({super.key});

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

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Dimensions.height12,
        ),
      ),
      child: AppScrollView(
        child: Column(
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
            Column(
              children: [
                Row(
                  children: [
                    // NumberPicker(
                    //
                    //   value: ,
                    //   minValue: 0,
                    //   maxValue: 100,
                    //   onChanged: (value) => setState(() => _currentValue = value),
                    // ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
