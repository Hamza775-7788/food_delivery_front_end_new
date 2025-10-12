import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/address/controller/address_controller.dart';
import 'package:food_delivery_front_end/Features/auth/view/splash_screen_view.dart';
import 'package:food_delivery_front_end/Features/favorite/controller/favorite_controller.dart';
import 'package:food_delivery_front_end/Features/order/controller/cart_controller.dart';
import 'package:food_delivery_front_end/core/theme/app_theme.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
late CartControllerImpl cartControllerImpl;
late FavoriteControllerImpl favoriteControllerImpl;
late AddressControllerImpl addressControllerImpl;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();
  cartControllerImpl = Get.put(CartControllerImpl(), permanent: true);
  favoriteControllerImpl = Get.put(FavoriteControllerImpl());
  addressControllerImpl = Get.put(AddressControllerImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ligthTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
    );
  }
}
