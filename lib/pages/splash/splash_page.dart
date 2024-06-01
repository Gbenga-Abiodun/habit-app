import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/utils/dimensions.dart';
import 'package:habit_app/widgets/big_text.dart';

import '../../generated/assets.dart';
import '../../widgets/scroll_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.offAllNamed(RouteHelpers.getOnBoarding()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height15 * 5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                Assets.imagesSplashScreen,
              ),
            )),
            child: Column(
              children: [
                SizedBox(height: Dimensions.height12 * 8,),
                BigText(
                  text: "WELCOME TO\nMonumental \n     habits",
                  fontFamily: "Klasik",
                  color: AppColors.eclipse,
                  size: Dimensions.height10 * 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
