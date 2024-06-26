import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'circle_icon.dart';

class CustomAppBar extends StatelessWidget {
  final bool hasCircleImage;

  final Widget? leadingIcon;
  final Decoration? decoration;

  final Widget? lastChild;

  final String pageTitle;

  final void Function()? onTapLeading;

  final void Function()? onTapTrailing;
  // final bool? hasFirst;
  // final bool?
  const CustomAppBar(
      {Key? key,
      required this.hasCircleImage,
      this.decoration,
      this.lastChild,
      required this.pageTitle, this.leadingIcon, this.onTapLeading, this.onTapTrailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleIcon(
            onTap: onTapLeading,
            child: leadingIcon,
          ),
          SmallText(
            text: pageTitle,
            fontWeight: FontWeight.w700,
            color: AppColors.eclipse,
            size: Dimensions.font18,
          ),
          if (hasCircleImage)
            GestureDetector(
              onTap: onTapTrailing,
              child: Container(
                width: Dimensions.height11 * 4,
                height: Dimensions.height11 * 4,
                decoration: decoration,
                child: Center(
                  child: lastChild,
                ),
              ),
            ),
          if(hasCircleImage == false)
          SizedBox(
            width: Dimensions.height11 * 4,
            height: Dimensions.height11 * 4,
          ),
          // SizedBox(),
        ],
      ),
    );
  }
}
