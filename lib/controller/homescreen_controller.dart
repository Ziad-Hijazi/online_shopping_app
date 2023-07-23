import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/screens/homePage.dart';
import 'package:online_shopping/view/screens/notification.dart';

import '../view/screens/offers.dart';
import '../view/screens/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = const [
     HomePage(),
     ViewNotification(),
     Offers(),
     SettingsPage()
  ];
  List BottomAppBar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notification", "icon": Icons.notifications},
    {"title": "Offers", "icon": Icons.offline_bolt_outlined},
    {"title": "Settings", "icon": Icons.settings},
  ];
  @override
  changePage(i) {
    currentPage = i;
    update();
  }
}
