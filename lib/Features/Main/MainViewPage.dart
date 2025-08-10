import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/Main/viewModel.dart';
import 'package:get/get.dart';

class Mainviewpage extends StatefulWidget {
  const Mainviewpage({super.key});

  @override
  State<Mainviewpage> createState() => _MainviewpageState();
}

class _MainviewpageState extends State<Mainviewpage> {
  MainViewModle viewModle = MainViewModle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewModle.pages[viewModle.selcetPage],
      bottomNavigationBar: NavigationBar(
        height: 60,
        indicatorColor: Colors.transparent,
        selectedIndex: viewModle.selcetPage,
        onDestinationSelected: (val) {
          viewModle.selcetPage = val;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  size: 25,
                  color: Get.theme.colorScheme.primary,
                ),
                Text(
                  viewModle.homeLable,
                  style: TextStyle(color: Get.theme.colorScheme.primary),
                ),
              ],
            ),
            icon: Icon(Icons.home, color: Get.theme.colorScheme.secondary),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite,
                  size: 25,
                  color: Get.theme.colorScheme.primary,
                ),
                Text(
                  viewModle.favorteLable,
                  style: TextStyle(color: Get.theme.colorScheme.primary),
                ),
              ],
            ),
            icon: Icon(
              Icons.favorite_border,
              color: Get.theme.colorScheme.secondary,
            ),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset(AppIcons.cart),
                Icon(
                  Icons.shop_2,
                  size: 25,
                  color: Get.theme.colorScheme.primary,
                ),
                Text(
                  viewModle.cartLable,
                  style: TextStyle(color: Get.theme.colorScheme.primary),
                ),
              ],
            ),
            icon: Icon(Icons.shop, color: Get.theme.colorScheme.secondary),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  size: 25,
                  color: Get.theme.colorScheme.primary,
                ),
                Text(
                  viewModle.profilelable,
                  style: TextStyle(color: Get.theme.colorScheme.primary),
                ),
              ],
            ),
            icon: Icon(Icons.person, color: Get.theme.colorScheme.secondary),
            label: "",
          ),
        ],
      ),
    );
  }
}
