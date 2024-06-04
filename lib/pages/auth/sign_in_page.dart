import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/config/themes/gradient.dart';
import 'package:habit_app/widgets/oauth_button.dart';
import 'package:habit_app/widgets/scroll_view.dart';

import '../../generated/assets.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/small_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: Dimensions.height10* 66,
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
                    height: Dimensions.height10* 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.height10* 2,
                        ),
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.eclipse.withOpacity(
                            0.2,
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.svgsLoupe1,
                            width: 22,
                            height: 22,
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
              top: Dimensions.height8/4,
              child: Container(
                height: Dimensions.height10* 66,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: signUpGradient()
                ),
              ),
            ),
            // SizedBox(
            //
            // ),
            Positioned(
              top:        Dimensions.height10* 24,
              left: Dimensions.height10* 2,
              right: Dimensions.height10* 2,

              child: Column(
                children: [
                  SmallText(
                    text: "WELCOME TO \nMonumental habits".toUpperCase(),
                    size: 32,
                    fontFamily: "Klasik",
                    color: AppColors.eclipse,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32,),
                  OauthButton(
                    height: Dimensions.height10* 5,
                    text: "Continue with  Google", svgPath: Assets.svgsGoogle, spaceWidth: 30,),
                  SizedBox(height: Dimensions.height8,),
                  OauthButton(
                    height: Dimensions.height10* 5,
                    text: "Continue with  Facebook", svgPath: Assets.svgsFacebook, spaceWidth: 30,),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 356,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height10* 2,),
            topRight: Radius.circular(Dimensions.height10* 2,),
          )

        ),
      ),

    );
  }
}
