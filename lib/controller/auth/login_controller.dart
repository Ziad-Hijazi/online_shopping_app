import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/core/services/services.dart';
import 'package:online_shopping/data/datasource/remote/auth/login_data.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handlingData.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isHidePassword = true;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  showPassword() {
    isHidePassword = isHidePassword == true ? false : true;
    update();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  login() async {
    FormState formData = formState.currentState!;
    if (formData.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setInt("id", response['data']['users_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoutes.homepage);
          } else {
            Get.offNamed(AppRoutes.verifyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.nodatafailure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((token) {
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
