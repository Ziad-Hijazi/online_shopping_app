import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/address/view_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/data/model/address_model.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Address"),
      ),
      body: GetBuilder<ViewAddressController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return CardAddress(
                      addressModel: controller.data[i],
                      onPressedDelete: () {
                        controller.deleteAddress(
                            controller.data[i].addressId.toString());
                      },
                    );
                  }))),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onPressedDelete;
  const CardAddress(
      {super.key, required this.addressModel, this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            addressModel.addressName!,
            style: const TextStyle(fontSize: 25, color: AppColor.primaryColor),
          ),
          subtitle: Text(
              "${addressModel.addressCity!} - ${addressModel.addressStreet!}"),
          trailing: IconButton(
              onPressed: onPressedDelete,
              icon: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
