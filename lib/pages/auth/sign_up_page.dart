import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:habit_app/controller/onboarding_controller.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/controller/validation_controller.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/app_check_box.dart';
import 'package:habit_app/widgets/app_text_field.dart';
import 'package:habit_app/widgets/big_text.dart';
import 'package:habit_app/widgets/custom_button.dart';
import 'package:habit_app/widgets/oauth_button.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  var utilsController = Get.find<UtilsController>();
  var validationController = Get.find<ValidationController>();

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
                height: Dimensions.height10 * 4,
              ),
              SvgPicture.asset(
                Assets.svgsAuth1,
                fit: BoxFit.scaleDown,
                width: Dimensions.height12 * 15,
                height: Dimensions.height10 * 20,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              SmallText(
                text: "Create your account".toUpperCase(),
                size: Dimensions.height12 * 2,
                fontFamily: "Klasik",
                color: AppColors.eclipse,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              AppTextField(
                  hintText: "Name",
                  autoFocus: false,
                  focusNode: utilsController.focusNode1,
                  obscureText: false,
                  prefix: Obx(() {
                    return Icon(
                      Icons.person_2_outlined,
                      size: Dimensions.height12 * 2,
                      color: utilsController.isFocused1.value
                          ? AppColors.textInputColor
                          : AppColors.eclipse.withOpacity(0.5),
                    );
                  })),

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
                  focusNode: utilsController.focusNode2,
                  obscureText: false,
                  prefix: Obx(() {
                    return Icon(
                      Icons.mail_outline_rounded,
                      size: Dimensions.height12 * 2,
                      color: utilsController.isFocused2.value
                          ? AppColors.textInputColor
                          : AppColors.eclipse.withOpacity(0.5),
                    );
                  })),
              SizedBox(
                height: Dimensions.height8,
              ),
              AppTextField(
                  hintText: "Password",
                  autoFocus: false,
                  focusNode: utilsController.focusNode3,
                  obscureText: false,
                  suffix: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height12,
                      horizontal: Dimensions.height12,
                    ),
                    child: SmallText(
                      text: "Show",
                      decoration: TextDecoration.underline,
                      size: Dimensions.font16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.eclipse,
                    ),
                  ),
                  prefix: Obx(() {
                    return Icon(
                      Icons.lock_outlined,
                      size: Dimensions.height12 * 2,
                      color: utilsController.isFocused3.value
                          ? AppColors.textInputColor
                          : AppColors.eclipse.withOpacity(0.5),
                    );
                  })),
              SizedBox(
                height: Dimensions.height12 * 2,
              ),
              Obx(() {
                return AppCheckBox(
                  text: "Keep me signed in",
                  onTap: () => validationController.checkAllowSignIn(),
                  child: validationController.allowSignIn.value ? Center(
                    child: SvgPicture.asset(
                      Assets.svgsMark,
                      width: Dimensions.height10,
                      height: Dimensions.height8,
                      fit: BoxFit.scaleDown,
                      color: AppColors.eclipse
                      ,
                    ),
                  ) : null,
                );
              }),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Obx(() {
                return AppCheckBox(
                  text: "Email me about special pricing and more",
                  onTap: () => validationController.checkAllowEmailAndPricing(),
                  child: validationController.allowEmailAndPricing.value ? Center(
                    child: SvgPicture.asset(
                      Assets.svgsMark,
                      width: Dimensions.height10,
                      height: Dimensions.height8,
                      fit: BoxFit.scaleDown,
                      color: AppColors.eclipse
                      ,
                    ),
                  ) : null,
                );
              }),
              SizedBox(
                height: Dimensions.height12 * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10 * 2,
                ),
                child: CustomButton(
                  text: "Create Account",
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10 * 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.eclipse.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.height10,
                    ),
                    SmallText(
                      text: "Or sign in with",
                      size: Dimensions.height14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.eclipse.withOpacity(
                        0.5,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.height10,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.eclipse.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: Dimensions.height10 * 2,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OauthButton(
                    width: Dimensions.height10 * 18,
                    height: Dimensions.height10 * 5,
                    text: "Google",
                    svgPath: Assets.svgsGoogle, spaceWidth: 20,
                  ),
                  OauthButton(
                    width: Dimensions.height10 * 18,
                    height: Dimensions.height10 * 5,
                    text: "Facebook",
                    svgPath: Assets.svgsFacebook, spaceWidth: 20,
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              RichText(
                text: TextSpan(
                  // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Already have an account? ",
                  style: TextStyle(
                    fontSize: Dimensions.height14,
                    color: AppColors.eclipse,
                    // fontFamily: "DMSans",
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RouteHelpers.getSignIn(),);
                        },
                      text: 'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height14,
                        color: AppColors.eclipse,
                        // fontFamily: "DMSans",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
