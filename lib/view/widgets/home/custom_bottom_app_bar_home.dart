import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:online_shopping/controller/homescreen_controller.dart';
import 'package:online_shopping/view/widgets/home/custom_bottom_app_bar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, ((index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomBottomAppBar(
                      textButton: controller.BottomAppBar[i]['title'],
                      iconData: controller.BottomAppBar[i]['icon'],
                      onPressed: () {
                        controller.changePage(i);
                      },
                      active: controller.currentPage == i ? true : false,
                    );
            }))
          ],
        ),
      ),
    );
  }
}
