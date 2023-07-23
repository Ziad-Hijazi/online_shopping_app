import 'package:flutter/material.dart';
import 'package:online_shopping/core/constants/color.dart';

class CardShippingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;

  const CardShippingAddressCheckout(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.primaryColor2 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          body,
          style: TextStyle(
              color: isActive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
