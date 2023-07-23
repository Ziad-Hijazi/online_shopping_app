import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:online_shopping/core/constants/routes.dart';
import 'package:online_shopping/core/middleware/myMiddleware.dart';
import 'package:online_shopping/test.dart';
import 'package:online_shopping/test_view.dart';
import 'package:online_shopping/view/screens/address/add.dart';
import 'package:online_shopping/view/screens/address/view.dart';
import 'package:online_shopping/view/screens/auth/forgetPassword/forget_password.dart';
import 'package:online_shopping/view/screens/auth/login.dart';
import 'package:online_shopping/view/screens/auth/forgetPassword/reset_password.dart';
import 'package:online_shopping/view/screens/auth/signup.dart';
import 'package:online_shopping/view/screens/auth/forgetPassword/success_resetpassword.dart';
import 'package:online_shopping/view/screens/auth/success_signup.dart';
import 'package:online_shopping/view/screens/auth/forgetPassword/verify_code.dart';
import 'package:online_shopping/view/screens/auth/verify_code_signup.dart';
import 'package:online_shopping/view/screens/cart.dart';
import 'package:online_shopping/view/screens/checkout.dart';
import 'package:online_shopping/view/screens/myFavorite.dart';
import 'package:online_shopping/view/screens/homePage.dart';
import 'package:online_shopping/view/screens/homeScreen.dart';
import 'package:online_shopping/view/screens/itemsDetails.dart';
import 'package:online_shopping/view/screens/itemsScreen.dart';
import 'package:online_shopping/view/screens/languages.dart';
import 'package:online_shopping/view/screens/on_boarding.dart';
import 'package:online_shopping/view/screens/orders/archive.dart';
import 'package:online_shopping/view/screens/orders/details.dart';
import 'package:online_shopping/view/screens/orders/pending.dart';
import 'package:online_shopping/view/screens/settings.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Languages(), middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoutes.archiveOrders,
    page: () => const ArchiveOrders(),
  ),
  GetPage(
    name: AppRoutes.ordersDetails,
    page: () => const OrdersDetails(),
  ),
  GetPage(
    name: AppRoutes.pendingOrders,
    page: () => const OrdersPending(),
  ),
  GetPage(
    name: AppRoutes.checkout,
    page: () => const Checkout(),
  ),
  GetPage(
    name: AppRoutes.viewAddress,
    page: () => const ViewAddress(),
  ),
  GetPage(
    name: AppRoutes.addAddress,
    page: () => const AddAddress(),
  ),
  GetPage(
    name: AppRoutes.cart,
    page: () => const Cart(),
  ),
  GetPage(
    name: AppRoutes.settings,
    page: () => const SettingsPage(),
  ),
  GetPage(
    name: AppRoutes.myFavorite,
    page: () => const MyFavorite(),
  ),
  GetPage(
    name: AppRoutes.itemsdetails,
    page: () => const ItemsDetails(),
  ),
  GetPage(
    name: AppRoutes.homepage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.itemsScreen,
    page: () => const ItemsScreen(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoarding(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoutes.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
];
