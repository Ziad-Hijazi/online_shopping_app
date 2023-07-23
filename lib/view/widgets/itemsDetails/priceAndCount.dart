import 'package:flutter/material.dart';
import 'package:online_shopping/core/constants/color.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  final String count;
  final String price;

  const PriceAndCountItems(
      {super.key,
      required this.onPressedAdd,
      required this.onPressedRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onPressedAdd, icon: const Icon(Icons.add)),
            Container(
              padding:const EdgeInsets.only(bottom: 2),
              alignment: Alignment.center,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 30,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            IconButton(
                onPressed: onPressedRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price\$",
          style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
