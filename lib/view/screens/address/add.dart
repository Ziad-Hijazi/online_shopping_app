import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/address/add_controller.dart';
import 'package:online_shopping/core/class/handling_data_view.dart';
import 'package:online_shopping/view/widgets/auth/custom_button_auth.dart';
import 'package:online_shopping/view/widgets/auth/custom_text_form_auth.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<AddAddressController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    CustomTextFormAuth(
                      label: "country",
                      hint: "Enter country name",
                      icon: Icons.add_location,
                      myController: controller.name!,
                      isNumber: false,
                      myValidator: (val) {},
                    ),
                    CustomTextFormAuth(
                      label: "city",
                      hint: "Enter country name",
                      icon: Icons.location_city_outlined,
                      myController: controller.city!,
                      isNumber: false,
                      myValidator: (val) {},
                    ),
                    CustomTextFormAuth(
                      label: "street",
                      hint: "Enter street name",
                      icon: Icons.streetview_outlined,
                      myController: controller.street!,
                      isNumber: false,
                      myValidator: (val) {},
                    ),
                    CustomButtonAuth(
                      text: "Save",
                      onPressed: () {
                        controller.addAddress();
                      },
                    )
                  ],
                ))),
      ),
    );
  }
}
