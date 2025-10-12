import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/order/controller/order_controller.dart';
import 'package:food_delivery_front_end/Features/order/viewModel/all_order_view_model.dart';
import 'package:food_delivery_front_end/Features/order/widget/order_list_item.dart';
import 'package:get/state_manager.dart';

class AllOrderViewPage extends StatefulWidget {
  const AllOrderViewPage({super.key});

  @override
  State<AllOrderViewPage> createState() => _AllOrderViewPageState();
}

class _AllOrderViewPageState extends State<AllOrderViewPage> {
  AllOrderViewModel viewModel = AllOrderViewModel();

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
              itemCount: viewModel.allOrder.length,
              itemBuilder: (context, index) {
                final order = viewModel.allOrder[index];

                return MyOrderListItem(order: order);
              },
            ),
          ],
        );
      },
    );
  }
}
