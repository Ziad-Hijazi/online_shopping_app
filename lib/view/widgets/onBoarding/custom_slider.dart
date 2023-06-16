import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/core/constants/color.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            onBoardingList[i].image!,
            height: Get.width / 1.2,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            onBoardingList[i].title!,
            style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: AppColor.primaryColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            onBoardingList[i].body!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColor.grey,
              fontSize: 15,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
