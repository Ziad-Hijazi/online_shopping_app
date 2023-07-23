import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/cart_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/view/widgets/cart/custom_button_cart.dart';
import 'package:online_shopping/view/widgets/cart/custom_button_coupon.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;

  final String totalPrice;
  final TextEditingController couponController;
  final void Function()? onPressedApplyCoupon;

  const BottomNavigationBarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.totalPrice,
    required this.couponController,
    this.onPressedApplyCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponName == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: couponController,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 9, horizontal: 10),
                              hintText: "Coupon Code",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButtonCoupon(
                              textButton: "Apply",
                              onPressed: onPressedApplyCoupon,
                            ))
                      ],
                    ))
                : Text(
                    "Coupon Code: ${controller.couponName}",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "price",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$price\$",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "discount",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$discount%",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "shipping",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$shipping\$",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const Divider(
                indent: 22,
                endIndent: 22,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$totalPrice\$",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          onPressed: () {
            controller.goToCheckout();
          },
          textButton: 'Order',
        )
      ],
    );
  }
}
