import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/core/functions/handlingData.dart';
import 'package:online_shopping/data/datasource/remote/address_data.dart';

import '../../core/class/status_request.dart';
import '../../core/services/services.dart';

class AddAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homepage);
        return Get.snackbar("Success", "You can order to this address");
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }
}
