import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/order/controller/order_controller.dart';
import 'package:food_delivery_front_end/Features/order/viewModel/pending_view_model.dart';
import 'package:food_delivery_front_end/Features/order/widget/order_list_item.dart';
import 'package:get/get.dart';

class PendingViewPage extends StatefulWidget {
  const PendingViewPage({super.key});

  @override
  State<PendingViewPage> createState() => _PendingViewPageState();
}

class _PendingViewPageState extends State<PendingViewPage> {
  PendingViewModel viewModel = PendingViewModel();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderControllerImpl>(
      builder: (controller) {
        return CustomScrollView(
          slivers: [
            SliverList.separated(
              separatorBuilder: (context, index) {
                return Divider(color: Color(0xffEDEDED));
              },
              itemCount: viewModel.pendingOrders.length,
              itemBuilder: (context, index) {
                final order = viewModel.pendingOrders[index];

                return MyOrderListItem(order: order);
              },
            ),
          ],
        );
      },
    );
  }
}
