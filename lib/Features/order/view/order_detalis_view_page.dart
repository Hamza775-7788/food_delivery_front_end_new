import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/order/viewModel/order_detalis_view_model.dart';
import 'package:food_delivery_front_end/core/constant/image.dart';
import 'package:food_delivery_front_end/core/helper/status_names.dart';
import 'package:food_delivery_front_end/core/model/order_modle.dart';
import 'package:get/get.dart';

class OrderDetalisViewPage extends StatefulWidget {
  final OrderModle order;
  const OrderDetalisViewPage({required this.order, super.key});

  @override
  State<OrderDetalisViewPage> createState() => _OrderDetalisViewPageState();
}

class _OrderDetalisViewPageState extends State<OrderDetalisViewPage> {
  late OrderDetalisViewModel viewModel;

  @override
  void initState() {
    viewModel = OrderDetalisViewModel(order: widget.order);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      backgroundColor: Get.theme.colorScheme.inversePrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16)),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 163,
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 120,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            viewModel.orderNumberLable,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Get.theme.colorScheme.surface,
                            ),
                          ),
                          Text(
                            viewModel.order.id.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Get.theme.colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        SizedBox(height: 80),
                        Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),

                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(AppIcons.money, height: 25),

                                      FittedBox(
                                        child: Text(
                                          viewModel.uponReceiptLable,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Get.theme.colorScheme.surface,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              VerticalDivider(
                                color: Get.theme.colorScheme.surface,
                                thickness: 0.3,
                                // فراغ من أسفل
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(AppIcons.bag, height: 25),

                                      Text(
                                        viewModel.order.piecesNumber.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Get.theme.colorScheme.surface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: Get.theme.colorScheme.surface,
                                thickness: 0.3,
                                // فراغ من أسفل
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        AppIcons.dateIcon,
                                        height: 25,
                                      ),

                                      Text(
                                        viewModel.order.createdAt
                                            .toLocal()
                                            .toString()
                                            .split(" ")
                                            .first,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Get.theme.colorScheme.surface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Get.theme.colorScheme.surface,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.orderStatusLable,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Image.asset(
                        getStatusIcon(viewModel.order.orderStatusID),
                        height: 25,
                      ),
                      subtitle: Text(
                        "last Update at ${viewModel.order.updatedAt.toLocal().toString()}",
                      ),
                      title: Text(
                        getStatusName(viewModel.order.orderStatusID),
                        style: TextStyle(
                          color: Get.theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Get.theme.colorScheme.surface,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.productsLable,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...viewModel.items.map(
                      (e) => ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(e.product.name),
                        trailing: Text(e.quntity.toString()),
                        subtitle: Text(e.totle.toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Get.theme.colorScheme.surface,
                ),
                child: ListTile(
                  title: Text(
                    viewModel.invoiceTotalLable,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    viewModel.order.totle.toString(),
                    style: TextStyle(color: Get.theme.colorScheme.primary),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Get.theme.colorScheme.surface,
                ),
                child: ListTile(
                  title: Text(
                    viewModel.deliveryAddressLable,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(viewModel.order.address),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
