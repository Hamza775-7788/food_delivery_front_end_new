import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_front_end/core/erorrs/excsptions.dart';
import 'package:food_delivery_front_end/core/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CASHED_TOKEN = "CASHED_TOKEN";
const CASHED_USER = "CASHED_USER";

class LocalDataSource {
  SharedPreferences _sharedPreferences;
  LocalDataSource({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  Future<String> getToken() async {
    final _token = _sharedPreferences.getString(CASHED_TOKEN);

    if (_token == null) {
      throw EmptyCashdDataSourceExceptions();
    } else {
      return _token;
    }
  }

  Future<Unit> cashedToken({required String token}) async {
    await _sharedPreferences.setString(CASHED_TOKEN, token);
    return unit;
  }

  Future<Unit> cashedUser(UserModel user) async {
    final body = user.toJson();
    await _sharedPreferences.setString(CASHED_USER, jsonEncode(body));
    return unit;
  }

  Future<UserModel?> getUserData() async {
    final _user = _sharedPreferences.getString(CASHED_USER);

    if (_user != null) {
      final jsonData = jsonDecode(_user);
      return UserModel.fromJson(jsonData);
    }
    return null;
  }
}
