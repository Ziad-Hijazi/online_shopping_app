import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/cart_data.dart';
import 'package:online_shopping/data/model/cart_model.dart';
import 'package:online_shopping/data/model/coupon_model.dart';
import '../core/class/status_request.dart';
import '../core/functions/handlingData.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  double priceOrders = 0.0;
  int totalcountitems = 0;
  TextEditingController? couponController;
  int discountCoupon = 0;
  String? couponName;
  String? couponId;
  CouponModel? couponModel;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
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

  goToCheckout() {
    if (data.isEmpty) return Get.snackbar("Warning", "The Cart Is Empty");
    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponid": couponId ?? "0",
      "priceorder": priceOrders.toString(),
      "discountcoupon": discountCoupon.toString()
    });
  }

  getTotalPrice() {
    return (priceOrders - priceOrders * discountCoupon / 100);
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
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

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(couponController!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = int.parse(couponModel!.couponDiscount.toString());
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("Warning", "Coupon Not Valid");
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
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
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
        }
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    view();
    super.onInit();
  }
}
