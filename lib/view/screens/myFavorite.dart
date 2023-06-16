import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/view/widgets/favorite/custom_list_favorite_items.dart';
import '../../controller/myFavorite_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../widgets/custom_app_bar_home.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
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
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.7),
                            itemBuilder: (context, i) {
                              return CustomListFavoriteItems(
                                itemsModel: controller.data[i],
                              );
                            }))
                  ],
                )),
      ),
    );
  }
}
