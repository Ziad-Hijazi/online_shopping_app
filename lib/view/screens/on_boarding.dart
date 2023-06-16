import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/onboarding_controller.dart';
import '../widgets/onBoarding/custom_button.dart';
import '../widgets/onBoarding/custom_dot_controller.dart';
import '../widgets/onBoarding/custom_slider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Column(
                children: const [
                  CustomDotControllerOnboarding(),
                  Spacer(),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
