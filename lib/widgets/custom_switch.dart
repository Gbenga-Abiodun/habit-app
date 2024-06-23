import 'package:flutter/material.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  void didUpdateWidget(CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {
        value = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!value);
        setState(() {
          value = !value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: Dimensions.height12 * 4.5,
        height: Dimensions.height10 * 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height15),
          color: value ? AppColors.eclipse.withOpacity(0.2) : AppColors.eclipse.withOpacity(0.2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              // curve: Curves.linear,
              left: value ? null : 2.2,
              right: value ? 2.2 : null,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: Dimensions.height11 * 2,
                height: Dimensions.height11 * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.eclipse,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: value ? Dimensions.height8 : null,
              right: value ? null : Dimensions.height8,
              child: SmallText(
                text: value ? "On" : "Off",
                color: AppColors.eclipse,
                fontWeight: FontWeight.w700,
                size: Dimensions.height10,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
