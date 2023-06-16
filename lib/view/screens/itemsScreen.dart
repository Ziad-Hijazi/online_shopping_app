import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/favorite_controller.dart';
import 'package:online_shopping/controller/items_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/data/model/items_model.dart';
import 'package:online_shopping/view/widgets/items/custom_list_items.dart';
import 'package:online_shopping/view/widgets/items/list_categories_items.dart';

import '../widgets/custom_app_bar_home.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBarHome(
                onPressedFavorite: () {
                  Get.toNamed(AppRoutes.myFavorite);
                },
                title: "Find Product",
                onPressedSearch: () {}),
            const SizedBox(
              height: 20,
            ),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, i) {
                          controllerFav
                                  .isFavorite[controller.data[i]['items_id']] =
                              controller.data[i]['favorite'];
                          return CustomListItems(
                            active: true,
                            itemsModel: ItemsModel.fromJson(controller.data[i]),
                          );
                        })))
          ],
        ),
      ),
    );
  }
}
