import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:food_delivery_front_end/core/constant/helper.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/local_dara_source/local_data_source.dart';
import 'package:food_delivery_front_end/core/model/order_modle.dart';
import 'package:food_delivery_front_end/core/network/network.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get_connect/connect.dart';

abstract class OrderRepository {
  Future<Either<Failure, Unit>> addOrder({required OrderModle order});
  Future<Either<Failure, Unit>> updateOrder({required OrderModle order});
  Future<Either<Failure, Unit>> delete({required int id});
  Future<Either<Failure, Unit>> accept({required int id});
  Future<Either<Failure, Unit>> reject({required int id});
  Future<Either<Failure, Unit>> ship({required int id});
  Future<Either<Failure, Unit>> deliver({required int id});
  Future<Either<Failure, Unit>> returned({required int id});
  Future<Either<Failure, List<OrderModle>>> showOrder();
  Future<Either<Failure, List<OrderModle>>> showWithStats({
    required int statusID,
  });
}

class OrderRepositoryImpl implements OrderRepository {
  final GetConnect getConnect = GetConnect();
  final NetworkInfo networkInfo = NetworkInfo();
  final LocalDataSource localDataSource = LocalDataSource(
    sharedPreferences: sharedPreferences,
  );
  @override
  Future<Either<Failure, Unit>> accept({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/orders/$id/accept",
        {},
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addOrder({required OrderModle order}) async {
    if (await networkInfo.isConnected) {
      final body = order.toJson();
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/order",
        jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> delete({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/orders/$id/delete",
        {},
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deliver({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/orders/$id/deliver",
        {},
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> reject({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/orders/$id/reject",
        {},
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> returned({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/orders/$id/return",
        {},
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> ship({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/orders/$id/ship",
        {},
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModle>>> showOrder() async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.get(
        "$rootApi/order/user",
        headers: headers,
      );
      print("$rootApi/order/user");
      print(token);

      if (response.statusCode == 200) {
        final jsonData = response.body;

        final listData = jsonData['data'] as List;

        return Right(
          listData.map<OrderModle>((e) => OrderModle.fromJson(e)).toList(),
        );
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModle>>> showWithStats({
    required int statusID,
  }) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.get(
        "$rootApi/order/user/$statusID",
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = response.body;

        final listData = jsonData['data'] as List;

        return Right(
          listData.map<OrderModle>((e) => OrderModle.fromJson(e)).toList(),
        );
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateOrder({required OrderModle order}) async {
    if (await networkInfo.isConnected) {
      final body = order.toJson();
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.put(
        "$rootApi/order/${order.id}",
        jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else if (response.statusCode == 400) {
        return Left(StatusChangeNotAllowedFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
