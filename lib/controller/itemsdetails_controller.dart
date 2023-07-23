import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/class/status_request.dart';
import 'package:online_shopping/core/functions/handlingData.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/cart_data.dart';
import 'package:online_shopping/data/model/items_model.dart';

abstract class ItemsDetailsController extends GetxController {}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  int countItems = 0;

  initialData() async {
    itemsModel = Get.arguments['itemsmodel'];
    statusRequest = StatusRequest.loading;
    countItems = await getCountItems(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        countItems = 0;
        countItems = int.parse(response['data'].toString());
        return countItems;
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
  }

  addItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
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
            "Added to Cart successfully",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        );
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  deleteItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
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
            "Deleted from Cart successfully",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        );
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  add() {
    addItems(itemsModel.itemsId.toString());
    countItems++;
    update();
  }

  delete() {
    deleteItems(itemsModel.itemsId.toString());
    countItems--;
    update();
  }

  List subItems = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "black", "id": 2, "active": "0"},
    {"name": "blue", "id": 3, "active": "1"},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
