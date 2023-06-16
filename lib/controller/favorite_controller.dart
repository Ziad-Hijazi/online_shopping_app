import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/favorite_data.dart';

import '../core/class/status_request.dart';
import '../core/functions/handlingData.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          titleText: const Text(
            "SUCCESS",
            style: TextStyle(
                color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          messageText: const Text(
            "Added to favorites successfully",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        );
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
  }

  deleteFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.deleteFavorite(
        myServices.sharedPreferences.getInt("id").toString(), itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          titleText: const Text(
            "SUCCESS",
            style: TextStyle(
                color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          messageText: const Text(
            "Deleted from favorites successfully",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        );
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
  }
}
