import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/favorite_controller.dart';
import 'package:online_shopping/controller/items_controller.dart';
import 'package:online_shopping/core/functions/translate_database.dart';
import 'package:online_shopping/data/model/items_model.dart';
import 'package:online_shopping/linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final bool active;
  const CustomListItems({
    super.key,
    required this.itemsModel,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: Image.network(
                  "${AppLink.imagesItems}/${itemsModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              // CachedNetworkImage(
              //   imageUrl: AppLink.imagesItems + "/${itemsModel.itemsImage}",
              //   height: 100,
              //   fit: BoxFit.fill,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Text(
                translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                size: 15,
                              ))
                    ]),
                  )
                ],
              ),
              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemsPrice}\$",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GetBuilder<FavoriteController>(
                      builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModel.itemsId, 0);
                                controller.deleteFavorite(
                                    itemsModel.itemsId.toString());
                              } else {
                                controller.setFavorite(itemsModel.itemsId, 1);
                                controller
                                    .addFavorite(itemsModel.itemsId.toString());
                              }
                            },
                            icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined),
                            color: Colors.red,
                          ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
