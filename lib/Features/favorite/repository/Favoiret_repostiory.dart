import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/main.dart';

abstract class FavoiretRepostiory {
  Future<Either<Failure, Unit>> saveProduct(ProductModel product);
  Future<Either<Failure, Unit>> deleteProduct(ProductModel product);
  Future<Either<Failure, List<ProductModel>>> getProducts();
}

const String CASHED_PRODUCT = 'CASHED_PRODUCT';

class FavoiretRepostioryImpl implements FavoiretRepostiory {
  @override
  Future<Either<Failure, Unit>> deleteProduct(ProductModel product) async {
    var proudcts = _getData();
    proudcts.removeWhere((e) => e.id == product.id);
    await _saveData(proudcts);
    return Right(unit);
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    final proudcts = _getData();
    return Right(proudcts);
  }

  @override
  Future<Either<Failure, Unit>> saveProduct(ProductModel product) async {
    var proudcts = _getData();
    proudcts.removeWhere((e) => e.id == product.id);
    proudcts.insert(0, product);

    await _saveData(proudcts);
    return Right(unit);
  }

  List<ProductModel> _getData() {
    final data = sharedPreferences.getString(CASHED_PRODUCT);

    if (data != null) {
      final jsonData = jsonDecode(data) as List;
      final listProduct =
          jsonData.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
      return listProduct;
    }
    return [];
  }

  Future _saveData(List<ProductModel> products) async {
    final data = products.map((e) => e.toJson()).toList();
    await sharedPreferences.setString(CASHED_PRODUCT, jsonEncode(data));
  }
}

class FavoritRepoisntoyWithFireBase implements FavoiretRepostiory {
  @override
  Future<Either<Failure, Unit>> deleteProduct(ProductModel product) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveProduct(ProductModel product) {
    // TODO: implement saveProduct
    throw UnimplementedError();
  }
}
