import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/homepage_controller.dart';
import 'package:online_shopping/core/functions/translate_database.dart';
import 'package:online_shopping/data/model/categories_model.dart';

import '../../../core/constants/color.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
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

class Categories extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,
            categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xff2c3e50).withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.network(
              "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              translateDatabase(categoriesModel.categoriesNameAr,
                  categoriesModel.categoriesName),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
