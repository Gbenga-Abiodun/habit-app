import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/base/shimmer/children/community_list_shimmer.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:habit_app/controller/comment_controller.dart';
import 'package:habit_app/model/comments.dart';
import 'package:habit_app/widgets/scroll_view.dart';
import 'package:habit_app/widgets/small_text.dart';

import '../../controller/user_controller.dart';
import '../../generated/assets.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/top_space.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({Key? key}) : super(key: key);

  var userController = Get.find<UserController>();

  var commentController = Get.find<CommentController>();

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
              height: Dimensions.height12 * 2.166666666666667,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height10 * 2,
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: Dimensions.height10 * 62,
              child: Obx(() {
                return ListView.builder(
                  itemCount: commentController.isLoading.isFalse
                      ? commentController.commentList.length
                      : 4,
                  padding: EdgeInsets.zero,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  commentController.isLoading.isFalse
                        ? buildComments(
                      context,
                      commentController.commentList[index],
                      index,
                    ) : CommunityListShimmer();
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildComments(BuildContext context, Comments comment, int index) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
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
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.height10,
          ),
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.font16,
              right: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: Dimensions.height12 * 2.333333333333333,
                      height: Dimensions.height12 * 2.333333333333333,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            "${AppConstants.baseUrl}${comment.avatarUrl
                                .toString()}",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.height10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(
                          text: comment.userName.toString(),
                          fontWeight: FontWeight.w700,
                          size: Dimensions.height14,
                          color: AppColors.eclipse,
                        ),
                        SmallText(
                          text: "41 mins ago",
                          fontWeight: FontWeight.w500,
                          size: Dimensions.height12,
                          color: AppColors.eclipse.withOpacity(0.4),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  width: Dimensions.height12 * 2.666666666666667,
                  height: Dimensions.height12 * 2.666666666666667,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.eclipse.withOpacity(
                      0.2,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    Assets.svgsShareicon,
                    fit: BoxFit.scaleDown,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height8 / 2,
          ),
          Divider(
            color: AppColors.scaffoldBg2,
          ),
          SizedBox(
            height: Dimensions.font10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.font16,
            ),
            child: SmallText(
              text: comment.comment.toString(),
              fontWeight: FontWeight.w500,
              color: AppColors.eclipse,
              size: Dimensions.height14,
            ),
          ),
          SizedBox(
            height: Dimensions.height12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: Dimensions.font16,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgsLove,
                    ),
                    SizedBox(width: Dimensions.height8 / 3,),
                    SmallText(
                      text: "3.1k",
                      size: Dimensions.height8,
                      fontWeight: FontWeight.w500,
                      color: AppColors.eclipse,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: Dimensions.font16,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgsSpeechBubble1,
                    ),
                    SizedBox(width: Dimensions.height8 / 3,),
                    SmallText(
                      text: "22",
                      size: Dimensions.height8,
                      fontWeight: FontWeight.w500,
                      color: AppColors.eclipse,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
