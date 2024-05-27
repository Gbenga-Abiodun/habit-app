import 'package:flutter/material.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppCheckBox extends StatelessWidget {

  final String text;

  final Widget? child;
  const AppCheckBox({Key? key, required this.text, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.height12 * 2,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Dimensions.height10 * 2,
              height: Dimensions.height10 * 2,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.morning,
                borderRadius: BorderRadius.circular(Dimensions.height12/2),
                // border: Border.all(color: AppColors.purple),
              ),
              child: child,
            ),
            SizedBox(
              width: Dimensions.height12,
            ),
            Container(
              child: SmallText(
                text:
                    text,
                fontWeight: FontWeight.w500,
                color: AppColors.eclipse,
                size: Dimensions.font16,
              ),
            ),
          ],
        ));
  }
}
