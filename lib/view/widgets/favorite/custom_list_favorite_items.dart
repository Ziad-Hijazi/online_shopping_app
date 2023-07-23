import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/myFavorite_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/functions/translate_database.dart';
import 'package:online_shopping/data/model/myFavorite_model.dart';
import 'package:online_shopping/linkapi.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  const CustomListFavoriteItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItemsDetails(itemsModel);
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

              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemsPrice}\$",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(
                            itemsModel.favoriteId.toString());
                      },
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: AppColor.primaryColor,
                        size: 35,
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
