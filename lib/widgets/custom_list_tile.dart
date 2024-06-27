import 'package:flutter/material.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class NormalListTileWidget extends StatelessWidget {

  final String NormalListTileTitle;
  final Widget? NormalListTileTrailing;

  final void Function()? onTap;
  const NormalListTileWidget({super.key, required this.NormalListTileTitle, this.NormalListTileTrailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      onTap: onTap,
      leadingChildTextNotLeading: SmallText(
        text: NormalListTileTitle,
        size: Dimensions.font16,
        fontWeight: FontWeight.w500,
        color: AppColors.eclipse,
      ),
      trailingWidgetNotLeading: NormalListTileTrailing,
    );
  }
}

class CustomListTile extends StatelessWidget {
  final bool hasLeading;
  final Widget? leadingChild;
  final Widget? leadingChildText;



  final void Function()? onTap;
  final Widget? leadingChildTextNotLeading;
  final Widget? trailingWidgetNotLeading;
  final Widget? trailingWidget;
  // final Widget? trailingChildText;
  // final Widget? trailingChild;

  const CustomListTile(
      {Key? key,
      this.hasLeading = false,
      this.leadingChild,
      this.leadingChildText,
      this.leadingChildTextNotLeading,
      this.trailingWidgetNotLeading,
      this.trailingWidget, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 5,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBg,
        borderRadius: BorderRadius.circular(
          Dimensions.height12,
        ),
      ),
      child: hasLeading == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: leadingChild,
                    ),
                    Container(
                      child: leadingChildText,
                    ),
                  ],
                ),
                Container(
                  child: trailingWidget,
                ),
              ],
            )
          : Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: leadingChildTextNotLeading,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    child: trailingWidgetNotLeading,
                  ),
                )
              ],
            ),
    );
  }
}
