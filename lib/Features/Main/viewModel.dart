import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/favorite/view/favorite_view.dart';
import 'package:food_delivery_front_end/Features/home/view/home_view.dart';
import 'package:food_delivery_front_end/Features/order/view/cart_view_page.dart';
import 'package:food_delivery_front_end/Features/setting/view/setting_view.dart';

class MainViewModle {
  String homeLable = "Home";
  String favorteLable = "Favorite";
  String profilelable = "Profile";
  String cartLable = "Cart";

  int selcetPage = 0;
  List<Widget> get pages {
    return [HomeView(), FavoriteView(), CartViewPage(), SettingView()];
  }
}
