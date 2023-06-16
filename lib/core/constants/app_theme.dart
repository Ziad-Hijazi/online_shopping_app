import 'package:flutter/material.dart';
import 'package:online_shopping/core/constants/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Lato",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(
      color: AppColor.grey,
      fontSize: 15,
      height: 2,
    ),
  ),
  primarySwatch: Colors.blue,
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(
      color: AppColor.grey,
      fontSize: 15,
      height: 2,
    ),
  ),
  primarySwatch: Colors.blue,
);
