import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/order/controller/cart_controller.dart';
import 'package:food_delivery_front_end/Features/order/viewModel/cart_viewModel.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/state_manager.dart';

class CartViewPage extends StatefulWidget {
  const CartViewPage({super.key});

  @override
  State<CartViewPage> createState() => _CartViewPageState();
}

class _CartViewPageState extends State<CartViewPage> {
  CartViewmodel viewModel = CartViewmodel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.title),
          bottom: TabBar(
            tabs: [
              Tab(text: viewModel.cartLable),
              Tab(text: viewModel.pendingOrdersLable),
              Tab(text: viewModel.ordersLable),
            ],
          ),
        ),
        body: GetBuilder<CartControllerImpl>(
          builder: (controller) {
            // if (controller.cart == null) {
            //   return Container(
            //     child: Center(child: Image.asset(AppImage.noData)),
            //   );
            // }
            return TabBarView(
              children: [
                // ================= Cart ========================
                CustomScrollView(
                  slivers: [
                    SliverList.separated(
                      itemCount: controller.cart?.orderDetails.length ?? 0,
                      itemBuilder: (context, index) {
                        final order = controller.cart!.orderDetails[index];
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                  child: Image.network(
                                    order.product.fullImageUrl,
                                    fit: BoxFit.cover,
                                    height: 90,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order.product.name,
                                        style: AppStyles.normalStyleTitle(),
                                      ),
                                      Text(
                                        order.totle.toString(),
                                        style: AppStyles.priceStyle(),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.remove, size: 35),
                                          ),
                                          SizedBox(width: 16),
                                          Text(
                                            order.quntity.toString(),
                                            style:
                                                AppStyles.normalStyleTitleBold(),
                                          ),
                                          SizedBox(width: 16),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.add, size: 35),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                    ),
                  ],
                ),

                // ================= Cart ========================
                viewModel.pages[1],
                viewModel.pages[2],
              ],
            );
          },
        ),
      ),
    );
  }
}


/**
 * 
 ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.network(order.product.fullImageUrl),
                    ),
                    title: Text(
                      order.product.name,
                      style: AppStyles.normalStyleTitle(),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.totle.toString(),
                          style: AppStyles.priceStyle(),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove, size: 35),
                            ),
                            SizedBox(width: 16),
                            Text(
                              order.quntity.toString(),
                              style: AppStyles.normalStyleTitleBold(),
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: Icon(Icons.add, size: 35),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
 */