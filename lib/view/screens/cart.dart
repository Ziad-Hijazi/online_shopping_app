import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/cart_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/image_asset.dart';
import 'package:online_shopping/view/widgets/cart/app_bar_cart.dart';
import 'package:online_shopping/view/widgets/cart/bottom_navigation_bar_cart.dart';
import 'package:online_shopping/view/widgets/cart/top_card_cart.dart';

import '../widgets/cart/cart_list.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavigationBarCart(
              price: "${cartController.priceOrders}",
              shipping: "300.20",
              totalPrice: "500.20"),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      AppBarCart(title: 'My Cart'),
                      SizedBox(height: 10),
                      TopCardCart(
                          message:
                              "You Have ${cartController.totalcountitems} Items In Your List"),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartController.data.length,
                              (index) => CartList(
                                onAdd: () async {
                                  await cartController.add(cartController
                                      .data[index].itemsId
                                      .toString());
                                  cartController.refreshPage();
                                },
                                onDelete: () async {
                                  await cartController.delete(cartController
                                      .data[index].itemsId
                                      .toString());
                                  cartController.refreshPage();
                                },
                                imagename:
                                    "${cartController.data[index].itemsImage}",
                                name: "${cartController.data[index].itemsName}",
                                price:
                                    "${cartController.data[index].itemsPrice}",
                                count:
                                    "${cartController.data[index].countitems}",
                              ),
                            )

                            // CartList(
                            //     name: 'Macbook M2 Max',
                            //     price: '200.00',
                            //     count: '3'),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
