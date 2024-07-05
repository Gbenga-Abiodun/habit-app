import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/widgets/scroll_view.dart';

import '../../controller/user_controller.dart';
import '../../generated/assets.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/top_space.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({Key? key}) : super(key: key);

  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: AppScrollView(
        child: Column(
          children: [
            TopSpace(),
            CustomAppBar(
              hasCircleImage: true,
              pageTitle: "Community",
              imageChild: userController.userModel!.profilePhoto.isNotEmpty
                  ? Container(
                      width: Dimensions.height11 * 4,
                      height: Dimensions.height11 * 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            userController.userModel!.profilePhoto,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: Dimensions.height11 * 4,
                      height: Dimensions.height11 * 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            Assets.imagesOnboardingOneAvatar,
                          ),
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
              height: Dimensions.height12  *2.166666666666667,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height10 * 2,
              ),
              width: MediaQuery.of(context).size.width,
              height: Dimensions.height10 * 62,
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: Dimensions.height10 * 16,
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
