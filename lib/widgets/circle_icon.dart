import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CircleIcon extends StatelessWidget {
  final Widget? child;
  final void Function()? onTap;
   const CircleIcon({Key? key, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.height10 * 2,
        ),
        width: Dimensions.height11 * 4,
        height: Dimensions.height11 * 4,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.eclipse.withOpacity(
            0.2,
          ),
        ),
        child: Center(child: child),

      ),
    );
  }
}
