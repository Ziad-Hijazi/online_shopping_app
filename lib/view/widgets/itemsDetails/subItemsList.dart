import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_shopping/controller/itemsdetails_controller.dart';
import 'package:online_shopping/core/constants/color.dart';

class SubItemsList extends GetView<ItemsDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            controller.subItems.length,
            (index) => Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    color: controller.subItems[index]['active'] == "1"
                        ? AppColor.primaryColor3
                        : Colors.white,
                    border: Border.all(color: AppColor.primaryColor3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    controller.subItems[index]['name'],
                    style: TextStyle(
                      color: controller.subItems[index]['active'] == "1"
                          ? Colors.white
                          : AppColor.primaryColor3,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
      ],
    );
  }
}
