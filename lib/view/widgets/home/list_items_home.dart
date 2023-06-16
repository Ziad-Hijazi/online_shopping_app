import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/homepage_controller.dart';
import 'package:online_shopping/core/functions/translate_database.dart';
import 'package:online_shopping/data/model/items_model.dart';
import 'package:online_shopping/linkapi.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        separatorBuilder: ((context, index) => const SizedBox(
              width: 10,
            )),
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            )),
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Image.network(
            "${AppLink.imagesItems}/${itemsModel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 120,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Text(
            translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName),
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
