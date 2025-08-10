import 'package:food_delivery_front_end/Features/favorite/repository/Favoiret_repostiory.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  Future<void> getFavorite();
  Future<void> addToFavorite(ProductModel product);
  Future<void> removeFromFavorite(ProductModel product);
}

class FavoriteControllerImpl extends FavoriteController {
  final FavoiretRepostiory repostiory = FavoiretRepostioryImpl();
  List<ProductModel> products = [];
  @override
  Future<void> addToFavorite(ProductModel product) async {
    lodingDialog();

    final request = await repostiory.saveProduct(product);
    Get.back();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (d) {
        handleSuccess();
        getFavorite();
      },
    );
  }

  @override
  Future<void> getFavorite() async {
    final request = await repostiory.getProducts();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (data) {
        products = data;
        update();
      },
    );
  }

  @override
  Future<void> removeFromFavorite(ProductModel product) async {
    final request = await repostiory.deleteProduct(product);
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (d) {
        handleSuccess();
        getFavorite();
      },
    );
  }
}
