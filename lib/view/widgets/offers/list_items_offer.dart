import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shopping/controller/favorite_controller.dart';
import 'package:online_shopping/controller/offers_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/constants/image_asset.dart';
import 'package:online_shopping/core/functions/translate_database.dart';
import 'package:online_shopping/data/model/items_model.dart';
import 'package:online_shopping/linkapi.dart';

class ListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  // final bool active;
  const ListItemsOffers({
    super.key,
    required this.itemsModel,
    // required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Card(
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
                    translateDatabase(
                        itemsModel.itemsNameAr, itemsModel.itemsName),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       "Rating 3.5",
                  //       style: TextStyle(fontSize: 15),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //     Container(
                  //       alignment: Alignment.bottomCenter,
                  //       height: 22,
                  //       child: Row(children: [
                  //         ...List.generate(
                  //             5,
                  //             (index) => const Icon(
                  //                   Icons.star,
                  //                   size: 15,
                  //                 ))
                  //       ]),
                  //     )
                  //   ],
                  // ),
                  // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (itemsModel.itemsDiscount != 0)
                            Text(
                              "${itemsModel.itemsPrice}\$",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: AppColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Text(
                            "${itemsModel.itemsPriceDiscount}\$",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    1) {
                                  controller.setFavorite(itemsModel.itemsId, 0);
                                  controller.deleteFavorite(
                                      itemsModel.itemsId.toString());
                                } else {
                                  controller.setFavorite(itemsModel.itemsId, 1);
                                  controller.addFavorite(
                                      itemsModel.itemsId.toString());
                                }
                              },
                              icon: Icon(
                                  controller.isFavorite[itemsModel.itemsId] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined),
                              color: Colors.red,
                            ),
                            if (itemsModel.itemsDiscount != 0)
                              Text(
                                "Save ${itemsModel.itemsDiscount}%",
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          if (itemsModel.itemsDiscount != 0)
            Positioned(
              left: 10,
              child: Lottie.asset(AppImageAsset.sale, width: 150),
            )
        ],
      ),
    );
  }
}
