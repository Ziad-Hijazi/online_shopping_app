import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controller/homepage_controller.dart';
import 'package:online_shopping/core/constants/color.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  final String title;
  final String body;

  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryColor2,
                  borderRadius: BorderRadius.circular(150)),
              height: 160,
              width: 160,
            ),
          ),
        ],
      ),
    );
  }
}
