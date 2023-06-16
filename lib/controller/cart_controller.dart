import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/cart_data.dart';
import 'package:online_shopping/data/model/cart_model.dart';
import '../core/class/status_request.dart';
import '../core/functions/handlingData.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  double priceOrders = 0.0;
  int totalcountitems = 0;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
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

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
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

  resetVarCart() {
    totalcountitems = 0;
    priceOrders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .viewCart(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List responseData = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalcountitems =
              int.parse(dataresponsecountprice['totalcount'].toString());
          priceOrders =
              double.parse(dataresponsecountprice['totalprice'].toString());
          print(priceOrders);
        }
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
