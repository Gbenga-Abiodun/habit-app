import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/course_card.dart';
import 'package:habit_app/widgets/custom_app_bar.dart';
import 'package:habit_app/widgets/small_text.dart';
import 'package:habit_app/widgets/top_space.dart';

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Column(
        children: [
          TopSpace(),
          CustomAppBar(
            hasCircleImage: true,
            lastChild: CircleIcon(
              child: SvgPicture.asset(
                Assets.svgsSearch,
                color: AppColors.eclipse,
                width: Dimensions.height11 * 2,
                height: Dimensions.height11 * 2,
                fit: BoxFit.scaleDown,
              ),
            ),
            pageTitle: "Courses",
            leadingIcon: Icon(
              Icons.menu_outlined,
              color: AppColors.eclipse,
              size: Dimensions.height11 * 2,
            ),
          ),
          SizedBox(height: 32,),
          CourseCard(),
        ],
      ),
    );
  }
}
