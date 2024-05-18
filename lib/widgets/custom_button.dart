import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, required this.buttonColor}) : super(key: key);

  final void Function()? onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.morning,

        ),
        // child: Center(
        //   Sma
        // ),
      ),
    );
  }
}
