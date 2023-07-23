import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/orders/pending_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';

import '../../widgets/orders/orders_list_card.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) =>
                        CardOrdersList(listData: controller.data[i])))),
      ),
    );
  }
}
