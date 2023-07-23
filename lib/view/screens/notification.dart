import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/color.dart';

import '../../controller/notification_controller.dart';

class ViewNotification extends StatelessWidget {
  const ViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Notification",
                        style: TextStyle(
                            fontSize: 25,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                      controller.data.length,
                      (index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Stack(children: [
                              ListTile(
                                title: Text(controller.data[index]
                                    ['notification_title']),
                                subtitle: Text(controller.data[index]
                                    ['notification_body']),
                              ),
                              Positioned(
                                  top: 20,
                                  right: 5,
                                  child: Text(
                                    Jiffy(
                                            controller.data[index]
                                                ['notification_datetime'],
                                            "yyyy-MM-dd")
                                        .fromNow(),
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ]),
                          ))
                ],
              ),
            )));
  }
}
