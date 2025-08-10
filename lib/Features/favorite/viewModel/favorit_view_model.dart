import 'package:food_delivery_front_end/Features/favorite/controller/favorite_controller.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:get/get.dart';

class FavoritViewModel {
  String title = "Favorite";
  FavoritViewModel() {
    _controllerImpl.getFavorite();
  }
  FavoriteControllerImpl _controllerImpl = Get.find();

  Future onRefra() async {
    _controllerImpl.getFavorite();
  }

  List<ProductModel> get products => _controllerImpl.products;
}
