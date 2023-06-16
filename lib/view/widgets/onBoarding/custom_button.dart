import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/onboarding_controller.dart';

import '../../../core/constants/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: MaterialButton(
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        child: Text(
          "41".tr,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
