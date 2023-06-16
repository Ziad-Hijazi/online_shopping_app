import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/data/datasource/remote/auth/signup_data.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handlingData.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  SignupData signupData = SignupData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    FormState formData = formState.currentState!;
    if (formData.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        username.text,
        email.text,
        password.text,
        phone.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.nodatafailure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
