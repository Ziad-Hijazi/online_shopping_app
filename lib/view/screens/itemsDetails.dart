import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/itemsdetails_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/view/widgets/itemsDetails/priceAndCount.dart';
import 'package:online_shopping/view/widgets/itemsDetails/subItemsList.dart';
import 'package:online_shopping/view/widgets/itemsDetails/topItemsDetails.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          child: MaterialButton(
            color: AppColor.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
            child: const Text(
              "Go To Cart",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ItemsDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(children: [
              const TopItemsDetails(),
              const SizedBox(
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.itemsModel.itemsName}",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColor.primaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "${controller.itemsModel.itemsDesc}${controller.itemsModel.itemsDesc}",
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(
                      height: 20,
                    ),
                    PriceAndCountItems(
                      count: "${controller.countItems}",
                      price: "${controller.itemsModel.itemsPriceDiscount}",
                      onPressedAdd: () {
                        controller.add();
                      },
                      onPressedRemove: () {
                        controller.delete();
                      },
                    ),
                    // Text(
                    //   "Color",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .displayLarge!
                    //       .copyWith(color: AppColor.primaryColor3),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const SubItemsList(),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
