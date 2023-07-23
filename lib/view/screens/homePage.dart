import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_shopping/controller/homepage_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/data/model/items_model.dart';
import 'package:online_shopping/linkapi.dart';

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
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBarHome(
              mycontroller: controller.search,
              onPressedFavorite: () {
                Get.toNamed(AppRoutes.myFavorite);
              },
              title: "Find Product",
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? ListItemsSearch(
                        listDataModel: controller.listData,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomCardHome(title: "45", body: "46"),
                          CustomTitleHome(
                            title: "47",
                          ),
                          ListCategoriesHome(),
                          CustomTitleHome(
                            title: "48",
                          ),
                          ListItemsHome(),
                        ],
                      ))
            // const CustomTitleHome(
            //   title: "Offers",
            // ),
            // const ListItemsHome(),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listDataModel.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.goToItemsDetails(listDataModel[i]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.network(
                              "${AppLink.imagesItems}/${listDataModel[i].itemsImage}")),
                      Expanded(
                        child: ListTile(
                          title: Text(listDataModel[i].itemsName!),
                          subtitle: Text(listDataModel[i].categoriesName!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
