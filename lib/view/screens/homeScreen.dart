import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/homescreen_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/view/widgets/home/custom_bottom_app_bar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          child: const Icon(
            Icons.shopping_basket_outlined,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: WillPopScope(
          child: controller.listPage.elementAt(controller.currentPage),
          onWillPop: () {
            Get.defaultDialog(
              title: "Warning",
              titleStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.primaryColor),
              middleText: "Do You Want To Exit From The App",
              onConfirm: () {
                exit(0);
              },
              buttonColor: AppColor.primaryColor,
              confirmTextColor: Colors.white,
              cancelTextColor: AppColor.primaryColor,
              onCancel: () {},
            );
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
