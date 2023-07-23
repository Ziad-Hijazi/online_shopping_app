import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/homepage_data.dart';
import 'package:online_shopping/data/model/items_model.dart';

import '../core/class/status_request.dart';
import '../core/functions/handlingData.dart';

abstract class HomePageController extends SearchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoryId);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  List categories = [];
  List items = [];
  String? lang;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id")!;
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryId) {
    Get.toNamed(AppRoutes.itemsScreen, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catId": categoryId,
    });
  }

  goToItemsDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemsdetails, arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listData = [];
  late StatusRequest statusRequest;
  HomePageData homePageData = HomePageData(Get.find());
  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
