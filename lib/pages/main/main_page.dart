import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habit_app/navigation/course_page_navigation.dart';
import 'package:habit_app/navigation/home_page_navigation.dart';
import 'package:habit_app/pages/community/community_page.dart';
import 'package:habit_app/pages/course/course_page.dart';
import 'package:habit_app/pages/home/home_page.dart';
import 'package:habit_app/pages/settings/settings_page.dart';

import '../../controller/nav_controller.dart';
import '../../generated/assets.dart';
import '../../widgets/bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);



  var navController = Get.find<NavController>();




  @override
  Widget build(BuildContext context) {

    final List<GlobalKey<NavigatorState>> _navigatorKeys = [
      navController.homePageNavigatorKey,
      navController.coursePageNavigatorKey,
      navController.communityPageNavigatorKey,
      navController.settingsPageNavigatorKey,
    ];


    Future<bool> _systemBackButtonPressed() async {
      if (_navigatorKeys[navController.tabIndex.value].currentState?.canPop() == true) {
        _navigatorKeys[navController.tabIndex.value]
            .currentState
            ?.pop(_navigatorKeys[navController.tabIndex.value].currentContext);
        return false;
      } else {
        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        return true; // Indicate that the back action is handled
      }
    }
    // Menus currentIndex = Menus.home;
    return GetBuilder<NavController>(
      assignId: true,
      builder: (logic) {
        return WillPopScope(
          onWillPop: () => _systemBackButtonPressed(),
          child: Scaffold(
            body: IndexedStack(
              index: navController.tabIndex.value,
              children: [
                HomePageNavigation(),
                CoursePageNavigation(),
                CommunityPage(),
                SettingsPage(),
              ],
            ),
            bottomNavigationBar:  BottomNavigationBar(
              currentIndex: Menus.values[navController.tabIndex.value],
              onTap: (index) {
                navController.changeTabIndex(index);

              },
            ),
          ),
        );
      },
    );
  }
}

enum Menus {
  home,
  coursePage,
  communityPage,
  settingsPage,
}

class BottomNavigationBar extends StatelessWidget {

  final Menus currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: BottomNavigationItem(
                  icon: Assets.svgsXMLID1,
                  onPressed: () => onTap(Menus.home.index),
                  current: currentIndex,
                  name: Menus.home, inActive: Assets.svgsXMLID1active,
                ),
              ),
              Expanded(
                child: BottomNavigationItem(
                  icon: Assets.svgsCoursesactive,
                  onPressed: () => onTap(Menus.coursePage.index),
                  current: currentIndex,
                  name: Menus.coursePage, inActive: Assets.svgsCourses,
                ),
              ),
              Expanded(
                child: BottomNavigationItem(
                  icon: Assets.svgsCommunitactive,
                  onPressed: () => onTap(Menus.communityPage.index),
                  current: currentIndex,
                  name: Menus.communityPage, inActive: Assets.svgsCommunity,
                ),
              ),
              Expanded(
                child: BottomNavigationItem(
                  icon: Assets.svgsSettingsActive,
                  onPressed: () => onTap(Menus.settingsPage.index),
                  current: currentIndex,
                  name: Menus.settingsPage, inActive: Assets.svgsSettings,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
