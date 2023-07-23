import 'package:flutter/material.dart';
import 'package:online_shopping/core/constants/color.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imageName;
  final String title;
  final bool isActive;

  const CardDeliveryTypeCheckout(
      {super.key,
      required this.imageName,
      required this.title,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: isActive ? AppColor.primaryColor2 : null,
          border: Border.all(color: AppColor.primaryColor2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            width: 80,
            color: isActive ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : AppColor.primaryColor2,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
