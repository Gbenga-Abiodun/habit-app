import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;

  final TextDecoration? decoration;

  final FontWeight? fontWeight;

  final String? fontFamily;

  final TextAlign? textAlign;

  final Color? decorationColor;

  double size;

  SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF000000),
    this.fontWeight = FontWeight.w200,
    this.size = 0,
    this.decoration,
    this.decorationColor,
    this.fontFamily = "Manrope", this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
        decorationColor: decorationColor,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontSize: size == 0 ? Dimensions.font12 : size,
      ),
    );
  }
}
