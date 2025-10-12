import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/order/view/order_detalis_view_page.dart';
import 'package:food_delivery_front_end/core/helper/status_names.dart';
import 'package:food_delivery_front_end/core/model/order_modle.dart';
import 'package:get/get.dart';

class MyOrderListItem extends StatelessWidget {
  const MyOrderListItem({super.key, required this.order});

  final OrderModle order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.theme.colorScheme.surface,
        ),
        child: ListTile(
          onTap: () {
            Get.to(() => OrderDetalisViewPage(order: order));
          },
          leading: Image.asset(getStatusIcon(order.orderStatusID), height: 25),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getStatusName(order.orderStatusID),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.theme.colorScheme.primary,
                ),
              ),
              Text("Order Number (${order.id})"),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.address, overflow: TextOverflow.ellipsis),
              Text(order.createdAt.toLocal().toString()),
            ],
          ),
        ),
      ),
    );
  }
}
