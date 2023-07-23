import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/homepage_controller.dart';
import 'package:online_shopping/core/class/status_request.dart';
import 'package:online_shopping/core/functions/handlingData.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/model/items_model.dart';

import '../data/datasource/remote/items_data.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catVal);
  getItems(String categoryId);
  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  List categories = [];
  int? selectedCat;
  String? catId;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catId = Get.arguments['catId'];
    getItems(catId!);
  }

  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryId, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed("itemsdetails", arguments: {"itemsmodel": itemsModel});
  }
}
