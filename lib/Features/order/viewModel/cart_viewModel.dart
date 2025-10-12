import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/order/controller/order_controller.dart';
import 'package:food_delivery_front_end/Features/order/view/all_order_view_page.dart';
import 'package:food_delivery_front_end/Features/order/view/pending_view_page.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

class CartViewmodel {
  String title = "Cart";

  String ordersLable = "All Orders";
  String pendingOrdersLable = "Pending";
  String cartLable = "Cart";

  final controller = Get.put(OrderControllerImpl());
  List<Widget> get pages => [
    Container(),
    PendingViewPage(),
    AllOrderViewPage(),
  ];

  onAdd() async {
    if (cartControllerImpl.cart != null) {
      await controller.addOrder(order: cartControllerImpl.cart!);
    }
  }
}
