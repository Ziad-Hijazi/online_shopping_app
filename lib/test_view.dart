

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/test_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/class/status_request.dart';
import 'package:online_shopping/core/constants/color.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: const Text("Test View",),backgroundColor: AppColor.primaryColor,),
      body: GetBuilder<TestController>(builder: (controller){
        return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            
          }));
      }
    ),
    );
  }
}