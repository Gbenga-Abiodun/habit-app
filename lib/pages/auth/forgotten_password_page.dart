import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/custom_button.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../controller/utils_controller.dart';
import '../../controller/validation_controller.dart';
import '../../generated/assets.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/top_space.dart';

class ForgottenPasswordPage extends StatelessWidget {
  ForgottenPasswordPage({Key? key}) : super(key: key);

  // var utilsController = Get.find<UtilsController>();
  var validationController = Get.find<ValidationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: AppScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height10 * 2,
          ),
          child: Column(
            children: [
              TopSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleIcon(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      Assets.svgsBackIcon,
                      width: Dimensions.font16,
                      height: Dimensions.height12,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height12 * 2.333333333333333,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(
                    text: "Forgot your password?".toUpperCase(),
                    size: Dimensions.height12 * 2,
                    fontFamily: "Klasik",
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.height10 * 3,
              ),
              SvgPicture.asset(
                Assets.svgsReset,
                fit: BoxFit.scaleDown,
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height12 * 23.66666666666667,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: Dimensions.height10 * 36,
        color: AppColors.scaffoldBg2,
        child: AppScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: Dimensions.height12 * 31,
                height: Dimensions.height10 * 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    Dimensions.borderRadius12,
                  ),
                ),
                child: Form(
                  key: validationController.resetFormStateKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height10 * 2,
                      ),
                      SmallText(
                        text:
                            "Enter your registered email below to receive \n                  password reset instruction",
                        fontWeight: FontWeight.w500,
                        size: Dimensions.height14,
                        color: AppColors.eclipse,
                      ),
                      SizedBox(
                        height: Dimensions.height10 * 3,
                      ),
                      AppTextField(
                        hintText: "Email",
                        autoFocus: false,
                        // focusNode: utilsController.focusNode6,
                        obscureText: false,
                        fillColor: AppColors.scaffoldBg2,
                        controller: validationController.forgottenPasswordController,
                        onSaved: (value) =>
                        validationController.forgottenPassword = value!,
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
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height10 * 2,
                        ),
                        child: CustomButton(text: "Send Reset Link", onTap: () => validationController.checkReset(),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 5,
              ),
              RichText(
                text: TextSpan(
                  // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Remember password? ",
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
                          Get.back();
                        },
                      text: 'Login',
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
    );
  }
}
