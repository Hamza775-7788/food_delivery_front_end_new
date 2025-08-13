import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:food_delivery_front_end/core/constant/helper.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/local_dara_source/local_data_source.dart';
import 'package:food_delivery_front_end/core/model/address_model.dart';
import 'package:food_delivery_front_end/core/network/network.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<AddressModel>>> getAddress();
  Future<Either<Failure, Unit>> storeAddress({required AddressModel address});
  Future<Either<Failure, Unit>> updateAddress({required AddressModel address});
  Future<Either<Failure, Unit>> deleteAddress({required int id});
  Future<Either<Failure, Unit>> activeAddress({required int id});
}

class AddressRepositoryImpl implements AddressRepository {
  final GetConnect getConnect = GetConnect();
  final NetworkInfo networkInfo = NetworkInfo();
  final LocalDataSource localDataSource = LocalDataSource(
    sharedPreferences: sharedPreferences,
  );

  @override
  Future<Either<Failure, Unit>> activeAddress({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.get(
        "$rootApi/address/$id/activate",
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAddress({required int id}) async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.delete(
        "$rootApi/address/$id",
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getAddress() async {
    if (await networkInfo.isConnected) {
      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.get(
        "$rootApi/address",
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = response.body;
        var listData = jsonData['data'] as List;

        List<AddressModel> data =
            listData
                .map<AddressModel>((e) => AddressModel.fromJson(e))
                .toList();
        return Right(data);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> storeAddress({
    required AddressModel address,
  }) async {
    if (await networkInfo.isConnected) {
      final body = address.toJson();

      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.post(
        "$rootApi/address",
        jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAddress({
    required AddressModel address,
  }) async {
    if (await networkInfo.isConnected) {
      final body = address.toJson();

      final String token = await localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await getConnect.put(
        "$rootApi/address/${address.id}",
        jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
