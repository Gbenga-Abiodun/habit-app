import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/app_check_box.dart';
import 'package:habit_app/widgets/app_text_field.dart';
import 'package:habit_app/widgets/big_text.dart';
import 'package:habit_app/widgets/custom_button.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: AppScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height12 * 4,
              ),
              SvgPicture.asset(
                Assets.svgsAuth1,
                fit: BoxFit.scaleDown,
                width: Dimensions.height12 * 15.64666666666667,
                height: Dimensions.height10 * 20,
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              SmallText(
                text: "Create your account".toUpperCase(),
                size: Dimensions.height12 * 2,
                fontFamily: "Alice",
                color: AppColors.eclipse,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Dimensions.height12 * 2.666666666666667,
              ),
              AppTextField(
                hintText: "Name",
                autoFocus: false,
                obscureText: false,
                prefix: SvgPicture.asset(Assets.svgsUser,
                    color: AppColors.eclipse.withOpacity(0.5),
                    width: Dimensions.height14,
                    height: Dimensions.height10 / 2,
                    fit: BoxFit.scaleDown),
              ),

              // VerticalDivider(
              //   color: AppColors.eclipse,
              //   width: 300,
              // ),
              SizedBox(
                height: Dimensions.height8,
              ),
              AppTextField(
                  hintText: "Email",
                  autoFocus: false,
                  obscureText: false,
                  prefix: Icon(
                    Icons.mail_outline_rounded,
                    size: Dimensions.height10 * 2,
                    color: AppColors.eclipse.withOpacity(0.5),
                  )),
              SizedBox(
                height: Dimensions.height8,
              ),
              AppTextField(
                  hintText: "Password",
                  autoFocus: false,
                  obscureText: false,
                  prefix: Icon(
                    Icons.lock_outlined,
                    size: Dimensions.height10 * 2,
                    color: AppColors.eclipse.withOpacity(0.5),
                  )),
              SizedBox(
                height: Dimensions.height12* 2.333333333333333,
              ),
              AppCheckBox(text: "Keep me signed in"),
              SizedBox(
                height: Dimensions.height10* 2,
              ),
              AppCheckBox(text: "Email me about special pricing and more"),
              SizedBox(
                height: Dimensions.height12* 2.333333333333333,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10* 2,
                ),
                child: CustomButton(
                  text: "Create Account",
                ),
              ),
              SizedBox(height: Dimensions.height10* 2,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Dimensions.height10* 2,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.eclipse.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(width: Dimensions.height10,),
                    SmallText(text: "Or sign in with", size: Dimensions.height14, fontWeight: FontWeight.w500, color: AppColors.eclipse.withOpacity(0.5,),),
                    SizedBox(width: Dimensions.height10,),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.eclipse.withOpacity(0.5),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
