import 'package:flutter/material.dart';
import 'package:online_shopping/view/widgets/cart/custom_button_cart.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalPrice;

  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "price",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$price\$",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "shipping",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$shipping\$",
                  style: TextStyle(fontSize: 18),
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Total Price",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$totalPrice\$",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomButtonCart(
            onPressed: () {},
            textButton: 'Place Order',
          )
        ],
      ),
    );
  }
}
