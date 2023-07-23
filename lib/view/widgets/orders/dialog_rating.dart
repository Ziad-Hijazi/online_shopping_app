import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:online_shopping/controller/orders/archive_controller.dart';
import 'package:online_shopping/core/constants/color.dart';
import 'package:online_shopping/core/constants/image_asset.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String orderId) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      image: Lottie.asset(
        AppImageAsset.rating,
      ),
      submitButtonText: 'Submit',
      starSize: 45,
      submitButtonTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrdersController controller = Get.find();
        controller.submitRating(orderId, response.rating, response.comment);
      },
    ),
  );
}
