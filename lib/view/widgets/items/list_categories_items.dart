import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/items_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/functions/translate_database.dart';

import '../../../data/model/categories_model.dart';
import '../home/list_categories_home.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: ((context, index) => const SizedBox(
                width: 10,
              )),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index])))),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                      bottom:
                          BorderSide(width: 5, color: AppColor.primaryColor),
                    ))
                  : null,
              child: Text(
                translateDatabase(categoriesModel.categoriesNameAr,
                    categoriesModel.categoriesName),
                style: const TextStyle(fontSize: 25, color: AppColor.grey2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
