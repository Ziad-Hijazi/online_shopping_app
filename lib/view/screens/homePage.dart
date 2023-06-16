import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_shopping/controller/homepage_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/routes.dart';

import 'package:online_shopping/view/widgets/custom_app_bar_home.dart';
import 'package:online_shopping/view/widgets/home/list_categories_home.dart';

import '../widgets/home/custom_card_home.dart';
import '../widgets/home/custom_title_home.dart';
import '../widgets/home/list_items_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBarHome(
                  onPressedFavorite: () {
                    Get.toNamed(AppRoutes.myFavorite);
                  },
                  title: "Find Product",
                  onPressedSearch: () {}),
              const CustomCardHome(
                  title: "A Summer Surprise", body: "Cashback 50%"),
              const CustomTitleHome(
                title: "Categories",
              ),
              const ListCategoriesHome(),
              const CustomTitleHome(
                title: "Product for you",
              ),
              const ListItemsHome(),
              // const CustomTitleHome(
              //   title: "Offers",
              // ),
              // const ListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
