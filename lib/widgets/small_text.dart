import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
 final double? height;
  final TextDecoration? decoration;

  TextOverflow textOverflow;

  final FontWeight? fontWeight;

  final String? fontFamily;

  final double? letterSpacing;

  final TextAlign? textAlign;

  final Color? decorationColor;
  final int? maxLines;

  double size;

  SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF000000),
    this.fontWeight = FontWeight.w200,
    this.size = 0,
    this.decoration,
    this.maxLines = 3,
    this.decorationColor,
    this.textOverflow = TextOverflow.ellipsis,
    this.fontFamily = "Manrope", this.textAlign, this.letterSpacing, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
        letterSpacing: letterSpacing,
        decorationColor: decorationColor,
        height: height,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontSize: size == 0 ? Dimensions.font12 : size,
      ),
    );
  }
}
