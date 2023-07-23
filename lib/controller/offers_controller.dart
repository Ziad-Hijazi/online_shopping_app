import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/homepage_controller.dart';
import 'package:online_shopping/core/class/status_request.dart';
import 'package:online_shopping/core/functions/handlingData.dart';
import 'package:online_shopping/data/datasource/remote/offers_data.dart';
import 'package:online_shopping/data/model/items_model.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData2 = response['data'];
        data.addAll(listData2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search=TextEditingController();
    getData();
    super.onInit();
  }
}
