import 'package:get/get.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/model/myFavorite_model.dart';
import '../core/class/status_request.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/myFavorite_data.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    var response = favoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
