import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController implements GetxService{

  var tabIndex = 0.obs;

  GlobalKey<NavigatorState> homePageNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> coursePageNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> communityPageNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> settingsPageNavigatorKey = GlobalKey<NavigatorState>();
  void changeTabIndex(int index){
    tabIndex.value = index;
    update();
  }

}