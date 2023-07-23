import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/checkout_data.dart';
import 'package:online_shopping/data/model/address_model.dart';
import '../core/class/status_request.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/address_data.dart';

class CheckoutController extends GetxController {
  // AddressData addressData = AddressData(Get.find());
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  List<AddressModel> dataaddress = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String? paymentMethod;
  String? deliveryType;
  String? addressid = "0";
  late String couponid;
  late String coupondiscount;
  late String priceorders;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        dataaddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId;
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a delivery Type");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("Error", "Please select a shipping address");
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id")!,
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "paymentmethod": paymentMethod.toString(),
      "coupondiscount": coupondiscount.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("===================Controller $response=============");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homepage);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();

    getShippingAddress();
    super.onInit();
  }
}
