import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/course_card.dart';
import 'package:habit_app/widgets/custom_app_bar.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';
import 'package:habit_app/widgets/top_space.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as provider;

import '../../generated/assets.dart';
import '../../utils/dimensions.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: AppScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            TopSpace(),
            CustomAppBar(
              hasCircleTrailing: true,
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
            SizedBox(
              height: Dimensions.height12 * 2.666666666666667,
            ),
            const CourseCard(),
            SizedBox(
              height: Dimensions.font12,
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: Dimensions.height10 * 56,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: provider.Svg(
                        Assets.svgsBg2,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Dimensions.height11 * 3,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.height10 * 2,
                  ),
                  // color: Colors.white,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SmallText(
                            text: "Sort By:",
                            size: Dimensions.font16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.eclipse,
                          ),
                          // DropdownButtonHideUnderline(
                          //   child: DropdownButton2<String>(
                          //     isExpanded: true,
                          //     hint: Text(
                          //       'Select Item',
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //         color: Theme.of(context).hintColor,
                          //       ),
                          //     ),
                          //     items: items
                          //         .map(
                          //             (String item) => DropdownMenuItem<String>(
                          //                   value: item,
                          //                   child: Text(
                          //                     item,
                          //                     style: const TextStyle(
                          //                       fontSize: 14,
                          //                     ),
                          //                   ),
                          //                 ))
                          //         .toList(),
                          //     value: selectedValue,
                          //     onChanged: (String? value) {},
                          //     buttonStyleData: const ButtonStyleData(
                          //       padding: EdgeInsets.symmetric(horizontal: 16),
                          //       height: 40,
                          //       width: 140,
                          //     ),
                          //     menuItemStyleData: const MenuItemStyleData(
                          //       height: 40,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: Dimensions.height10 * 5,),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height10 * 2,
                      ),
                      height: Dimensions.height12 * 33.5,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: Dimensions.height10 * 19,
                            margin: EdgeInsets.only(
                              bottom: Dimensions.height12,

                            ),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                Dimensions.height12,
                              ),
                            ),
                          );
                        },),
                    ),
                  ],
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
