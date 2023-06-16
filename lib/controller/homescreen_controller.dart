import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/view/screens/homePage.dart';

import '../view/screens/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Settings"),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    SettingsPage()
  ];
  List BottomAppBar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notification", "icon": Icons.notifications},
    {"title": "Profile", "icon": Icons.person},
    {"title": "Settings", "icon": Icons.settings},
  ];
  @override
  changePage(i) {
    currentPage = i;
    update();
  }
}
