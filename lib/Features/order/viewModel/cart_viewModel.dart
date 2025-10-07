import 'package:flutter/material.dart';

class CartViewmodel {
  String title = "Cart";

  String ordersLable = "All Orders";
  String pendingOrdersLable = "Pending";
  String cartLable = "Cart";

  List<Widget> get pages => [Container(), Container(), Container()];
}
