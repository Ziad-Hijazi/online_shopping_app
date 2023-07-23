import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/checkout_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/constants/image_asset.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/view/widgets/checkout/card_payment_method.dart';
import 'package:online_shopping/view/widgets/checkout/card_shipping_address_checkout.dart';

import '../widgets/checkout/card_delivery_type_chechout.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.primaryColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text(
              "Checkout",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(children: [
                      const Text(
                        "Choose Payment Method",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0"); //0=>cash
                        },
                        child: CardPaymentMethod(
                          title: "Cash On Delivery",
                          isActive:
                              controller.paymentMethod == "0" ? true : false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1"); //1=>card
                        },
                        child: CardPaymentMethod(
                          title: "Payment Cards",
                          isActive:
                              controller.paymentMethod == "1" ? true : false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Choose Delivery Type",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0"); //0=>delivery
                            },
                            child: CardDeliveryTypeCheckout(
                              imageName: AppImageAsset.delivery,
                              title: "Delivery",
                              isActive:
                                  controller.deliveryType == "0" ? true : false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); //1=>receive
                            },
                            child: CardDeliveryTypeCheckout(
                              imageName: AppImageAsset.drivethru,
                              title: "Receive",
                              isActive:
                                  controller.deliveryType == "1" ? true : false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.dataaddress.isNotEmpty)
                              const Text(
                                "Shipping Address",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            if (controller.dataaddress.isEmpty)
                              InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.addAddress);
                                  },
                                  child: const Center(
                                      child: Text(
                                    "Please Add Shipping Address \n Click Here",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ))),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(controller
                                      .dataaddress[index].addressId
                                      .toString());
                                },
                                child: CardShippingAddressCheckout(
                                  title:
                                      "${controller.dataaddress[index].addressName}",
                                  body:
                                      "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                  isActive: controller.addressid ==
                                          controller
                                              .dataaddress[index].addressId
                                              .toString()
                                      ? true
                                      : false,
                                ),
                              ),
                            )
                          ],
                        )
                    ]),
                  ),
                )));
  }
}
