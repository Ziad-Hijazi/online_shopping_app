import 'package:get/get.dart';
import 'package:online_shopping/core/class/status_request.dart';
import 'package:online_shopping/core/functions/handlingData.dart';
import 'package:online_shopping/data/datasource/remote/test_data.dart';

class TestController extends GetxController{
  TestData testData=TestData(Get.find());
  List data=[];
  late StatusRequest statusRequest;
  getData()async{
    statusRequest=StatusRequest.loading;
    var response=await testData.getData();
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
      data.addAll(response['data']);

      }else{
        statusRequest=StatusRequest.nodatafailure;
      }
    }
    update();

  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  

}