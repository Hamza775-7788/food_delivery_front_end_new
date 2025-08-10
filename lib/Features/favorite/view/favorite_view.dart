import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/favorite/controller/favorite_controller.dart';
import 'package:food_delivery_front_end/Features/favorite/viewModel/favorit_view_model.dart';
import 'package:food_delivery_front_end/Features/home/widgets/product_home_widget.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/state_manager.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  FavoritViewModel viewModel = FavoritViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),

      body: GetBuilder<FavoriteControllerImpl>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: viewModel.onRefra,
            child: GridView.builder(
              itemCount: viewModel.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.2,
              ),
              itemBuilder: (context, index) {
                final product = viewModel.products[index];
                return ProductHomeWidget(
                  product: product,
                  onTap: () {
                    favoriteControllerImpl.removeFromFavorite(product);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
