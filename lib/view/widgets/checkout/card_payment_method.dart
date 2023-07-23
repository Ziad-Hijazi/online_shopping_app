import 'package:flutter/material.dart';
import 'package:online_shopping/core/constants/color.dart';

class CardPaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;

  const CardPaymentMethod({
    super.key,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive == true
              ? AppColor.primaryColor2
              : AppColor.primaryColor2a,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: isActive == true ? Colors.white : AppColor.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
