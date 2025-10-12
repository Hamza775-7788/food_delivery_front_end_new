import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/order/controller/cart_controller.dart';
import 'package:food_delivery_front_end/Features/order/viewModel/cart_viewModel.dart';
import 'package:food_delivery_front_end/core/constant/image.dart';
import 'package:food_delivery_front_end/core/shared/my_address_drop_down_list.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
        backgroundColor: Get.theme.colorScheme.inversePrimary,
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
            //   return MyEmptyWidget();
            // }
            return TabBarView(
              children: [
                // ================= Cart ========================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 14)),
                      SliverList.separated(
                        itemCount: controller.cart?.orderDetails.length ?? 0,
                        itemBuilder: (context, index) {
                          final order = controller.cart!.orderDetails[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(8),
                            ),
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
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              order.product.name,
                                              style:
                                                  AppStyles.normalStyleTitle(),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          order.totle.toString(),
                                          style: AppStyles.priceStyle(),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: 12,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    Get
                                                        .theme
                                                        .colorScheme
                                                        .inversePrimary,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.remove,
                                                      size: 35,
                                                    ),
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
                                                    icon: Icon(
                                                      Icons.add,
                                                      size: 35,
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
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16);
                        },
                      ),

                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(top: 16),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    controller.cart?.totle.toString() ?? "0",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Get.theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              MyAddressDropDownList(
                                onChanged: (data) {
                                  cartControllerImpl.cart?.address = data ?? "";
                                },
                                hint: "address",
                              ),
                              const SizedBox(height: 12),
                              MyGenralButton(
                                onPressed: () {
                                  viewModel.onAdd();
                                },
                                name: "Confirm order",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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