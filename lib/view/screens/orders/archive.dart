import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/orders/archive_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import '../../widgets/orders/archive_list_card.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archive"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ArchiveOrdersController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) =>
                        CardArchiveOrdersList(listData: controller.data[i])))),
      ),
    );
  }
}
