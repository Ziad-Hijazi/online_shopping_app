import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handlingData.dart';
import '../../data/datasource/remote/auth/verifycodesignup_data.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  goToSuccessSignUp(String verifyCodeSignUp);
  checkCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  VerifyCodeSignUpData verifyCodeSignUpData=VerifyCodeSignUpData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  String? email;


  @override
  goToSuccessSignUp(verifyCodeSignUp)async {
    statusRequest=StatusRequest.loading;
    update();
    var response=await verifyCodeSignUpData.postData( 
      email!,verifyCodeSignUp
    );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
    Get.offNamed(AppRoutes.successSignUp);
      }else{
        Get.defaultDialog(title: "Warning",middleText: "Verify Code is Not Correct");
        statusRequest=StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  checkCode() {}

  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }
}
