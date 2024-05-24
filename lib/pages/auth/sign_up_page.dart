import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/app_text_field.dart';
import 'package:habit_app/widgets/big_text.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(Assets.svgsAuth1 , fit: BoxFit.scaleDown, width: Dimensions.height12 * 15.64666666666667, height: Dimensions.height10 * 2,),
            SizedBox(height: Dimensions.height10 * 2,),
            SmallText(text: "Create your account", size: Dimensions.height12 * 2, fontFamily: "Alice", color: AppColors.eclipse, textAlign: TextAlign.center,),
            SizedBox(height: Dimensions.height12 * 2.666666666666667,),
            AppTextField(hintText: "Name", autoFocus: false, obscureText: false, prefix: SvgPicture.asset(Assets.svgsUser, color: AppColors.eclipse, width: Dimensions.height14, height: Dimensions.height10/2,),),
            AppTextField(hintText: "Email", autoFocus: false, obscureText: false, prefix: SvgPicture.asset(Assets.svgsMail, color: AppColors.eclipse, width: Dimensions.height14, height: Dimensions.height10/2,),),
            AppTextField(hintText: "Password", autoFocus: false, obscureText: false, prefix: SvgPicture.asset(Assets.svgsPassword, color: AppColors.eclipse,width: Dimensions.height14, height: Dimensions.height10/2,),),

          ],
        ),
      ),
    );
  }
}
