import 'package:flutter/material.dart';
import 'package:online_shopping/core/constants/color.dart';

class CustomButtonCart extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;

  const CustomButtonCart({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
