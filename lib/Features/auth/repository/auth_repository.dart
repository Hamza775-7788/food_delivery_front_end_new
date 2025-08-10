import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/Server/root_link.dart';
import 'package:food_delivery_front_end/core/constant/helper.dart';
import 'package:food_delivery_front_end/core/erorrs/excsptions.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/local_dara_source/local_data_source.dart';
import 'package:food_delivery_front_end/core/model/userModel.dart';
import 'package:food_delivery_front_end/core/network/network.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String passowrd,
  });
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String passowrd,
    required String userName,
  });
  Future<Either<Failure, Unit>> forgotePassowrd({required String email});
  Future<Either<Failure, Unit>> verifiyCode({
    required String email,
    required String code,
  });
  Future<Either<Failure, Unit>> restPassowrd({
    required String email,
    required String passowrd,
  });
  Future<Either<Failure, UserModel>> getUserData();
}

class AuthRepositoryImpl extends AuthRepository {
  final GetConnect _getConnect = GetConnect();
  final NetworkInfo _networkInfo = NetworkInfo();
  final LocalDataSource _localDataSource = LocalDataSource(
    sharedPreferences: sharedPreferences,
  );

  @override
  Future<Either<Failure, Unit>> forgotePassowrd({required String email}) async {
    if (await _networkInfo.isConnected) {
      final body = {"email": email};
      final response = await _getConnect.post(
        "$rootApi/forgot",
        jsonEncode(body),
        headers: headersList,
      );
      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          return const Right(unit);
        } else {
          return Left(InvalidEmailFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> restPassowrd({
    required String email,
    required String passowrd,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"email": email, "password": passowrd};

      final response = await _getConnect.post(
        "$rootApi/reset",
        jsonEncode(body),
        headers: headersList,
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
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String passowrd,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"email": email, "password": passowrd};

      final response = await _getConnect
          .post("$rootApi/signIn", jsonEncode(body), headers: headersList)
          .timeout(Duration(seconds: 5));

      if (response.statusCode == 200) {
        final jsonData = response.body;
        if (jsonData['status']) {
          final String token = jsonData['token'];
          await _localDataSource.cashedToken(token: token);
          return const Right(unit);
        } else {
          return Left(InvalidAccountFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String passowrd,
    required String userName,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"name": userName, "email": email, "password": passowrd};

      final response = await _getConnect.post(
        "$rootApi/signUp",
        jsonEncode(body),
        headers: headersList,
      );

      if (response.statusCode == 200) {
        final jsondata = response.body;
        if (jsondata['status'] == true) {
          // cashed token
          final String token = jsondata['token'];
          await _localDataSource.cashedToken(token: token);
          return const Right(unit);
        } else {
          final jsonData = response.body;
          if (jsonData['errors']["name"] != null) {
            return Left(NameExistsFailure());
          } else if (jsonData['errors']["email"] != null) {
            return Left(EmailExistsFailure());
          } else {
            return Left(OprtingFailure());
          }
        }
      } else if (response.statusCode == 422) {
        final jsonData = response.body;

        if (jsonData['errors']["name"] != null) {
          return Left(NameExistsFailure());
        } else if (jsonData['errors']["email"] != null) {
          return Left(EmailExistsFailure());
        } else {
          return Left(OprtingFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> verifiyCode({
    required String email,
    required String code,
  }) async {
    if (await _networkInfo.isConnected) {
      final body = {"code": code, "email": email};

      final response = await _getConnect.post(
        "$rootApi/code",
        jsonEncode(body),
        headers: headersList,
      );
      if (response.statusCode == 200) {
        final jsondata = response.body;
        if (jsondata['status'] == true) {
          return const Right(unit);
        } else {
          return Left(InvalidCodeFailure());
        }
      } else if (response.statusCode == 401) {
        return Left(InvalidCodeFailure());
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      final String token = await _localDataSource.getToken();
      var headers = headersList;
      headers['Authorization'] = 'Bearer $token';
      final response = await _getConnect
          .get("$rootApi/user", headers: headers)
          .timeout(Duration(seconds: 20));
      if (response.statusCode == 200) {
        print("==================");
        print(response.body);
        print("==================");
        final UserModel user = UserModel.fromJson(response.body);
        await _localDataSource.cashedUser(user);
        return Right(user);
      } else if (response.statusCode == 401) {
        return Left(UnauthenticatedFailure());
      } else {
        return Left(ServerFailure());
      }
    } on EmptyCashdDataSourceExceptions {
      return Left(EmptyCashdDataSourceFailure());
    }
  }
}

/*
{
status: true,
 user: {id: 7, name: userNAme, email: user123@gmail.com, email_verified_at: null, code_expires_at: 2025-05-03 07:10:40, created_at: 2025-05-03T06:51:24.000000Z, updated_at: 2025-05-03T07:00:40.000000Z},
  token: 10|dgMxhlkt0okNEm3pElowc7S5JI1QKIu8mIo5Ays61e16af0b
}

 */
