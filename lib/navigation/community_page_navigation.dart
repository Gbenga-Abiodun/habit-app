import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/nav_controller.dart';
import 'package:habit_app/pages/community/community_page.dart';
import 'package:habit_app/pages/profile/profile_page.dart';
import 'package:habit_app/pages/settings/settings_page.dart';

import '../routes/nav_routes.dart';

class CommunityPageNavigation extends GetView<NavController> {
  const CommunityPageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controller.communityPageNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              if (settings.name == AppRoutes.profilePage) {
                return ProfilePage();
              }
              return const CommunityPage();
            });
      },
    );
  }
}
