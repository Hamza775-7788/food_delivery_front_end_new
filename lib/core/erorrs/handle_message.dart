import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/erorrs/failures.dart';
import 'package:food_delivery_front_end/core/erorrs/strings.dart';
import 'package:get/get.dart';

handleErorr(Failure failure) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(_failureToString(failure)),
      backgroundColor: Colors.red,
    ),
  );
}

handleSuccess() {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,

      content: Text("Success"),
      backgroundColor: Colors.green,
    ),
  );
}

String _failureToString(Failure failure) {
  switch (failure) {
    case OfflineFailure():
      return MessageErorrString.offline;

    case ServerFailure():
      return MessageErorrString.server;
    case InvalidAccountFailure():
      return MessageErorrString.invalidAccount;
    case InvalidCodeFailure():
      return MessageErorrString.invalidCode;
    case InvalidEmailFailure():
      return MessageErorrString.invalidEmail;
    case EmailExistsFailure():
      return MessageErorrString.emailExists;
    case OprtingFailure():
      return MessageErorrString.oprting;
    case StatusChangeNotAllowedFailure():
      return MessageErorrString.statusChangeNotAllowed;

    default:
      return "Erorrr";
  }
}
