import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/home/controller/home_controller.dart';
import 'package:food_delivery_front_end/Features/home/viewmodel/home_viewModel.dart';
import 'package:food_delivery_front_end/Features/home/widgets/category_list_item.dart';
import 'package:food_delivery_front_end/Features/home/widgets/custom_sliver_app_bar_widgets.dart'
    show CustomSliverAppBar;
import 'package:food_delivery_front_end/Features/home/widgets/product_home_widget.dart';

import 'package:food_delivery_front_end/core/constant/image.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';

import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:food_delivery_front_end/main.dart';

import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewmodel viewmodel = HomeViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeControllrImpl>(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(AppImage.homeImage, fit: BoxFit.fill),
                    ),

                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Row(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Your Location",
                                        style: AppStyles.normalStyleTitleBold(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "New York City",
                                            style:
                                                AppStyles.normalStyleTitleBold(
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Spacer(),
                                AppBarButtonWithIcon(
                                  icon: Icon(
                                    Icons.search,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 16),
                                AppBarButtonWithIcon(
                                  icon: Icon(
                                    Icons.notifications_none_outlined,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              viewmodel.subtitle,
                              style: AppStyles.normalStyleTitleBold(
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    viewmodel.categoryLable,
                    style: AppStyles.normalStyleTitleBold(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CategoryListItem(
                    selectedIndex: viewmodel.selectCategory,
                    categories: viewmodel.categories,
                    onTap: (index) {
                      viewmodel.getProudct(index);
                      setState(() {});
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.2,
                ),
                itemCount: viewmodel.products.length,
                itemBuilder: (context, index) {
                  final product = viewmodel.products[index];
                  return ProductHomeWidget(
                    onTap: () {
                      favoriteControllerImpl.addToFavorite(product);
                    },
                    product: product,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
