import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:habit_app/base/custom_dialog.dart';
import 'package:habit_app/generated/assets.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/utils/colors.dart';
import 'package:habit_app/widgets/circle_icon.dart';
import 'package:habit_app/widgets/custom_app_bar.dart';
import 'package:habit_app/widgets/home_card.dart';
import 'package:habit_app/widgets/home_row.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';
import 'package:habit_app/widgets/top_space.dart';

import '../../controller/user_controller.dart';
import '../../utils/dimensions.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: AppScrollView(
        // height: MediaQuery.of(context).size.height,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            TopSpace(),

            CustomAppBar(
              hasCircleImage: true,
              pageTitle: "HomePage",
              onTapLeading: () => CustomDialog.showDialog(),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      userController.userModel!.profilePhoto,
                  ),
                ),
              ),
              leadingIcon: Icon(
                Icons.menu_outlined,
                color: AppColors.eclipse,
                size: Dimensions.height11 * 2,
              ),
            ),
            SizedBox(
              height: Dimensions.height12 * 2,
            ),
            HomeCard(),
            SizedBox(
              height: Dimensions.height12 * 2,
            ),
           Stack(
            children : [
              Container(
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height10 * 56,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: Svg(
                      Assets.svgsBg2,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: Dimensions.height12 * 2.8333333333333333,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SmallText(
                          text: "Habit".toUpperCase(),
                          fontWeight: FontWeight.w700,
                          size: Dimensions.height14,
                          color: AppColors.eclipse,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.height12 * 4.833333333333333,
                      // width: 58,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Container(
                            width: Dimensions.height10 * 5,
                            height: Dimensions.height10 * 5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              right: Dimensions.height12/2,
                              // left: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.scaffoldBg,
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.height12),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: Dimensions.height12,),
                                SmallText(
                                  text: "Sun",
                                  fontWeight: FontWeight.w700,
                                  size: Dimensions.height10,
                                  color: AppColors.eclipse.withOpacity(
                                    0.5,
                                  ),
                                ),
                                // SizedBox(height: 12,),
                                SmallText(
                                  text: "17",
                                  fontWeight: FontWeight.w700,
                                  size: Dimensions.font16,
                                  color: AppColors.eclipse,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: Dimensions.height10 * 2,
                top: Dimensions.height12 * 6.166666666666667,
                child: Column(
                  children: [
                    Column(
                      children: List.generate(4, (index) => HomeRow(),),
                    )
                  ],
                ),
              )



              // SizedBox(
              //   height: ,
              // ),
              // Spacer(),

             ]
           ),




            // Spacer(),
          ],
        ),
      ),
    );
  }
}
