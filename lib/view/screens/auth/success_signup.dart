import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/auth/successSignUp_controller.dart';
import 'package:online_shopping/view/widgets/auth/custom_body_text_auth.dart';
import '../../../core/constants/color.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_title_text_auth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text("27".tr),
        titleTextStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColor.grey),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomTitleTextAuth(
            text: "44",
          ),
          const CustomBodyTextAuth(text: "26"),
          const SizedBox(
            height: 80,
          ),
          const Spacer(),
          SizedBox(
            width: 400,
            child: CustomButtonAuth(
              onPressed: () {
                controller.goToLoginPade();
              },
              text: "40".tr,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
