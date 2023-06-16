import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/onboarding_controller.dart';

import '../../../core/constants/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnboarding extends StatelessWidget {
  const CustomDotControllerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              width: controller.currentPage == index ? 22 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(seconds: 1),
            ),
          ),
        ],
      ),
    );
  }
}
