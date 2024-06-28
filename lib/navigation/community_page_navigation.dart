import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/community/community_page.dart';
import 'package:habit_app/pages/habit/new_habit_page.dart';
import 'package:habit_app/pages/profile/profile_page.dart';
import 'package:habit_app/pages/settings/settings_page.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/routes/route_keys.dart';


class CommunityPageNavigation extends GetView<NavController> {
  const CommunityPageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RouteKeys.communityKey),
      onGenerateRoute: (RouteSettings settings) {
        return GetPageRoute(
          transition: Transition.rightToLeft,
          page: () {
            if(settings.name == RouteHelpers.profile){
              return ProfilePage();
            } else if(settings.name == RouteHelpers.newHabit){
             return NewHabitPage();
            }else{
              return CommunityPage();
            }
          },
        );
      },
    );
  }
}
