import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/main/main_page.dart';

class BottomNavigationItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;

  final double width;
  final double height;

  final String inActive;
  final Menus? current;
  final Menus? name;
  const BottomNavigationItem(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.current,
      this.name, required this.inActive, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(

        current == name
            ?icon : inActive,
        width: width,
        height: height,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
