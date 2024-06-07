import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {

  final String hintText;
  final TextEditingController? controller;

  final bool autoFocus;

  final Widget? prefix;

  final bool obscureText;

  final Widget? suffix;

  final Decoration? decoration;

  final void Function(String?)? onSaved;
  final Color? fillColor;
  final Color? inputColor;
  final Color? cursorColor;
  final void Function(String)? onFieldSubmitted;

  final BorderSide borderSide;
  final FocusNode? focusNode;

  final TextInputType? keyboardType;

  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  const AppTextField({Key? key, required this.hintText, this.controller, required this.autoFocus, this.prefix, required this.obscureText, this.suffix, this.decoration, this.onSaved, this.fillColor = Colors.white, this.onFieldSubmitted, this.borderSide = const BorderSide(
    width: 1.0,
    color: AppColors.textInputColor,
  ), this.keyboardType, this.inputFormatters, this.validator, this.cursorColor = const Color(0xFF573353), this.inputColor= const Color(0xFFFDA758), this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 56,

      decoration: decoration,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2,),
      child: TextFormField(

        focusNode: focusNode,
        style: TextStyle(
          color: inputColor,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.font16,
          // height: 56,

        ),
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        onSaved: onSaved,

        inputFormatters: inputFormatters,
        cursorColor: cursorColor,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefix,
          hintText: hintText,
          suffixIcon: suffix,
          hintStyle: TextStyle(
            color: AppColors.eclipse.withOpacity(0.5),
            fontSize: Dimensions.font16,
          ),
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: MobileDimensions.mobile48 / 4,
          //   horizontal: MobileDimensions.mobile48 / 4,
          // ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.borderRadius12,
              ),
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.borderRadius12,
              ),
            ),
            borderSide: BorderSide.none,
            // borderSide: BorderSide(
            //   width: 1.0,
            //   // color: AppColors.purple,
            // ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.borderRadius12,
              ),
            ),
            // borderSide: BorderSide.none,
            borderSide: BorderSide.none,
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                  Dimensions.borderRadius12,
              ),
            ),
            borderSide: BorderSide.none
            ,
          ),
        ),
      ),
    );
  }
}
