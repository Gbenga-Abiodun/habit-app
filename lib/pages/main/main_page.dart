import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habit_app/navigation/course_page_navigation.dart';
import 'package:habit_app/navigation/home_page_navigation.dart';
import 'package:habit_app/pages/community/community_page.dart';
import 'package:habit_app/pages/course/course_page.dart';
import 'package:habit_app/pages/home/home_page.dart';
import 'package:habit_app/pages/settings/settings_page.dart';

import '../../controller/nav_controller.dart';
import '../../generated/assets.dart';
import '../../routes/nav_routes.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
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
      if (_navigatorKeys[navController.tabIndex.value].currentState?.canPop() ==
          true) {
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
            extendBody: true,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: Menus.values[navController.tabIndex.value],
              onTap: (index) {
                if (index == 4) {
                  navController.homePageNavigatorKey.currentState?.pushNamed(AppRoutes.newHabit);
                  // Navigator.pushNamed(context, AppRoutes.newHabit);
                } else {
                  navController.changeTabIndex(index);
                }
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

  newHabit
}

class BottomNavigationBar extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 13,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Spacer(),
              Stack(
                children: [
                  CustomPaint(
                    size: Size(
                        MediaQuery.of(context).size.width,
                        (Dimensions.height10 * 8)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                  Positioned(
                    top: Dimensions.height12 * 2.25,
                    right: 0,
                    left: 0,
                    child: Container(
                      // color: Colors.white,
                      // height: ,
                      child: Row(
                        children: [
                          Expanded(
                            child: BottomNavigationItem(
                              icon: Assets.svgsXMLID1,
                              onPressed: () => onTap(Menus.home.index),
                              current: currentIndex,
                              name: Menus.home,
                              inActive: Assets.svgsXMLID1active,
                              width: Dimensions.height10 * 5,
                              height: Dimensions.height10 * 3,
                            ),
                          ),
                          Expanded(
                            child: BottomNavigationItem(
                              icon: Assets.svgsCoursesactive,
                              onPressed: () => onTap(Menus.coursePage.index),
                              current: currentIndex,
                              name: Menus.coursePage,
                              inActive: Assets.svgsCourses,
                              width: Dimensions.height10 * 4,
                              height: Dimensions.height12 * 2.916666666666667,
                            ),
                          ),
                          Expanded(
                            child: BottomNavigationItem(
                              icon: Assets.svgsCommunitactive,
                              onPressed: () => onTap(Menus.communityPage.index),
                              current: currentIndex,
                              name: Menus.communityPage,
                              inActive: Assets.svgsCommunity,
                              width: Dimensions.height10 * 4,
                              height: Dimensions.height12 * 3,
                            ),
                          ),
                          Expanded(
                            child: BottomNavigationItem(
                              icon: Assets.svgsSettingsActive,
                              onPressed: () => onTap(Menus.settingsPage.index),
                              current: currentIndex,
                              name: Menus.settingsPage,
                              inActive: Assets.svgsSettings,
                              width: Dimensions.height10 * 4,
                              height: Dimensions.height10 * 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Dimensions.height10 * 6,
            child: GestureDetector(
              onTap: () => onTap(Menus.newHabit.index),
              child: Container(
                width: Dimensions.height12 * 5.333333333333333,
                height: Dimensions.height12 * 5.333333333333333,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textInputColor.withOpacity(
                    0.2,
                  ),
                ),
                child: Container(
                  width: 52,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textInputColor,
                  ),
                  child: SvgPicture.asset(
                    Assets.svgsVector,
                    color: AppColors.eclipse,
                    width: Dimensions.font18,
                    height: Dimensions.font18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * 0.2900048, 0);
    path_0.cubicTo(
        size.width * 0.3326232,
        0,
        size.width * 0.3744831,
        size.height * 0.05835450,
        size.width * 0.4113357,
        size.height * 0.1691400);
    path_0.lineTo(size.width * 0.4558961, size.height * 0.3031000);
    path_0.cubicTo(
        size.width * 0.4835531,
        size.height * 0.3862437,
        size.width * 0.5176884,
        size.height * 0.3865613,
        size.width * 0.5454034,
        size.height * 0.3039287);
    path_0.lineTo(size.width * 0.5913647, size.height * 0.1668975);
    path_0.cubicTo(size.width * 0.6280386, size.height * 0.05755412,
        size.width * 0.6696208, 0, size.width * 0.7119469, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
