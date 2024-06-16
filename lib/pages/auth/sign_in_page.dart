import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/config/themes/gradient.dart';
import 'package:habit_app/controller/utils_controller.dart';
import 'package:habit_app/controller/validation_controller.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/custom_button.dart';
import 'package:habit_app/widgets/oauth_button.dart';
import 'package:habit_app/widgets/scroll_view.dart';

import '../../generated/assets.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/small_text.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  var utilsController = Get.find<UtilsController>();
  var validationController = Get.find<ValidationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: Dimensions.height10 * 66,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    Assets.imagesSplashScreencropped,
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height10 * 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:   EdgeInsets.symmetric(
                    horizontal: Dimensions.height10 * 2,
                  ),
                        child: CircleIcon(
                          child: SvgPicture.asset(
                            Assets.svgsLoupe1,
                            width: Dimensions.height11 * 2,
                            height: Dimensions.height11 * 2,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Stack(
                  //   children: [
                  //     Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 692,
                  //       decoration: BoxDecoration(
                  //         gradient: signUpGradient(),
                  //       ),
                  //
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Positioned(
              top: Dimensions.height8 / 4,
              child: Container(
                height: Dimensions.height10 * 66,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(gradient: signUpGradient()),
              ),
            ),
            // SizedBox(
            //
            // ),
            Positioned(
              top: Dimensions.height10 * 24,
              left: Dimensions.height10 * 2,
              right: Dimensions.height10 * 2,
              child: Column(
                children: [
                  SmallText(
                    text: "WELCOME TO \nMonumental habits".toUpperCase(),
                    size: Dimensions.height12 * 2.666666666666667,
                    fontFamily: "Klasik",
                    color: AppColors.eclipse,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Dimensions.height12 * 2.666666666666667,
                  ),
                  OauthButton(
                    height: Dimensions.height10 * 5,
                    text: "Continue with  Google",
                    svgPath: Assets.svgsGoogle,
                    spaceWidth: Dimensions.height10 * 4,
                  ),
                  SizedBox(
                    height: Dimensions.height8,
                  ),
                  OauthButton(
                    height: Dimensions.height10 * 5,
                    text: "Continue with  Facebook",
                    svgPath: Assets.svgsFacebook,
                    spaceWidth: Dimensions.height10 * 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: Dimensions.height12 * 29.66666666666667,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Dimensions.height10 * 2,
            ),
            topRight: Radius.circular(
              Dimensions.height10 * 2,
            ),
          ),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: validationController.signInFormStateKey,
          child: AppScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height12,
                ),
                SmallText(
                  text: "Log in with email",
                  size: Dimensions.font16,
                  color: AppColors.eclipse,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: Dimensions.height12,
                ),
                Divider(
                  color: AppColors.scaffoldBg2,
                ),
                SizedBox(
                  height: Dimensions.font16,
                ),
                AppTextField(
                    hintText: "Email",
                    autoFocus: false,
                    focusNode: utilsController.focusNode4,
                    obscureText: false,
                    fillColor: AppColors.scaffoldBg2,
                    controller: validationController.loginEmailController,
                    onSaved: (value) =>
                    validationController.loginEmail = value!,
                    validator: (value) =>
                        validationController.validateEmail(value!),

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
                    prefix: Obx(() {
                      return Icon(
                        Icons.mail_outline_rounded,
                        size: Dimensions.height12 * 2,
                        color: utilsController.isFocused4.value
                            ? AppColors.textInputColor
                            : AppColors.eclipse.withOpacity(0.5),
                      );
                    })),
                SizedBox(
                  height: Dimensions.height8,
                ),
                Obx(() {
                  return AppTextField(
                    hintText: "Password",
                    autoFocus: false,
                    focusNode: utilsController.focusNode5,
                    obscureText: validationController.isPasswordHidden.value,
                    fillColor: AppColors.scaffoldBg2,
                    controller: validationController.loginPasswordController,
                    onSaved: (value) =>
                    validationController.loginPassword = value!,
                    validator: (value) =>
                        validationController.validatePassword(value!),
                    suffix: GestureDetector(
                      onTap: () {
                        validationController.isPasswordHidden.value =
                            !validationController.isPasswordHidden.value;
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          Dimensions.height12,
                        ),
                        child: SmallText(
                          text: validationController.isPasswordHidden.value
                              ? "Show"
                              : "Hide",
                          decoration: TextDecoration.underline,
                          size: Dimensions.font16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.eclipse,
                        ),
                      ),
                    ),
                    prefix: Icon(
                      Icons.lock_outlined,
                      size: Dimensions.height12 * 2,
                      color: utilsController.isFocused5.value
                          ? AppColors.textInputColor
                          : AppColors.eclipse.withOpacity(0.5),
                    ),
                  );
                }),
                SizedBox(
                  height: Dimensions.height10 * 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height10 * 2,
                  ),
                  child:  CustomButton(text: "Login", onTap: () => validationController.checkSignIn()),
                ),
                SizedBox(
                  height: Dimensions.height14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(
                        RouteHelpers.getReset(),
                      ),
                      child: SmallText(
                        text: "Forgot Password?",
                        size: Dimensions.height14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.eclipse,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height12 / 2,
                ),
                RichText(
                  text: TextSpan(
                    // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "Don’t have an account? ",
                    style: TextStyle(
                      fontSize: Dimensions.height14,
                      color: AppColors.eclipse,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope",
                      // fontFamily: "DMSans",
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(
                              RouteHelpers.getSignUp(),
                            );
                          },
                        text: 'Sign up',
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
                SizedBox(
                  height: Dimensions.height10 ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
