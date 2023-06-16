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
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
