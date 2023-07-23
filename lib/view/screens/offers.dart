import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/offers_controller.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/view/widgets/offers/list_items_offer.dart';

import '../../controller/favorite_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../data/model/items_model.dart';
import '../widgets/custom_app_bar_home.dart';
import '../widgets/items/custom_list_items.dart';
import 'homePage.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  const SizedBox(height: 20),
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isSearch
                        ? ListItemsSearch(
                            listDataModel: controller.listData,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            itemBuilder: (context, i) {
                              return ListItemsOffers(
                                itemsModel: controller.data[i],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ));
  }
}
