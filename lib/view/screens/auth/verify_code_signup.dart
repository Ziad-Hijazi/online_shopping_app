import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/auth/verifyCodeSignUp_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/view/widgets/auth/custom_body_text_auth.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widgets/auth/custom_title_text_auth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("30".tr),
          titleTextStyle: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
          centerTitle: true,
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 35),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTitleTextAuth(text: "31"),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomBodyTextAuth(
                            text:
                                "Please Enter Digital Code To ${controller.email}"),
                        const SizedBox(
                          height: 30,
                        ),
                        OtpTextField(
                          fieldWidth: 55,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          },
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
