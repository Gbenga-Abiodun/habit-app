import 'package:flutter/material.dart';
import 'package:habit_app/utils/dimensions.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? buttonColor;


  final Color? textColor;

  final String? fontFamily;

  final String text;
  const CustomButton({Key? key, this.onTap,  this.buttonColor = const Color(0xFFFFBA7C), required this.text, this.textColor =const  Color(0xFF573353),this.fontFamily = "Manrope",}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimensions.height10 * 6,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.height8),),

        ),
        child: Center(
          child: SmallText(text: text, color: textColor, fontWeight: FontWeight.bold, fontFamily: fontFamily, size: Dimensions.font16,),
        ),
      ),
    );
  }
}
