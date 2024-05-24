import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/big_text.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../generated/assets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(Assets.svgsAuth1 , fit: BoxFit.scaleDown, width: 187.76, height: 200,),
            SizedBox(height: 20,),
            SmallText(text: "Create your account", size: 24, fontFamily: "Alice", color: AppColors.eclipse, textAlign: TextAlign.center,),
            SizedBox(height: 32,),

          ],
        ),
      ),
    );
  }
}
