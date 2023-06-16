import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/homepage_data.dart';

import '../core/class/status_request.dart';
import '../core/functions/handlingData.dart';

abstract class HomePageController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoryId);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  int? id;
  HomePageData homePageData = HomePageData(Get.find());
  List categories = [];
  List items = [];
  late StatusRequest statusRequest;
  String? lang;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  void onInit() {
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
}
