import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/itemsdetails_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/linkapi.dart';

class TopItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const TopItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
          ),
        ),
        Positioned(
          top: 10.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: Image.network(
              "${AppLink.imagesItems}/${controller.itemsModel.itemsImage}",
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
