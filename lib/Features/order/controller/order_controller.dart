import 'package:food_delivery_front_end/Features/order/repository/order_repository.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/order_modle.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

abstract class OrderController extends GetxController {
  Future<void> addOrder({required OrderModle order});
  Future<void> updateOrder({required OrderModle order});
  Future<void> delete({required int id});
  Future<void> accept({required int id});
  Future<void> reject({required int id});
  Future<void> ship({required int id});
  Future<void> deliver({required int id});
  Future<void> returned({required int id});
  Future<void> showOrder();
  Future<void> showWithStats({required int statusID});
}

class OrderControllerImpl extends OrderController {
  final OrderRepository repository = OrderRepositoryImpl();
  List<OrderModle> pending = [];
  List<OrderModle> allOrder = [];
  @override
  Future<void> accept({required int id}) async {
    try {
      lodingDialog();
      final response = await repository.accept(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> addOrder({required OrderModle order}) async {
    try {
      lodingDialog();
      final response = await repository.addOrder(order: order);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
          cartControllerImpl.clearOrder();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> delete({required int id}) async {
    try {
      lodingDialog();
      final response = await repository.delete(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> deliver({required int id}) async {
    try {
      lodingDialog();
      final response = await repository.deliver(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> reject({required int id}) async {
    try {
      lodingDialog();
      final response = await repository.reject(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> returned({required int id}) async {
    try {
      lodingDialog();
      final response = await repository.returned(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> ship({required int id}) async {
    try {
      lodingDialog();
      final response = await repository.ship(id: id);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> showOrder() async {
    // try {
    final response = await repository.showOrder();
    Get.back();
    response.fold(
      (failure) {
        handleErorr(failure);
      },
      (data) {
        allOrder = data;
        update();
      },
    );
    // } catch (e) {
    //   Get.dialog(ErrorDialog(message: "$e"));
    // }
  }

  @override
  Future<void> showWithStats({required int statusID}) async {
    try {
      final response = await repository.showWithStats(statusID: statusID);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (data) {
          pending = data;
          update();
        },
      );
    } catch (e) {
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }

  @override
  Future<void> updateOrder({required OrderModle order}) async {
    try {
      lodingDialog();
      final response = await repository.updateOrder(order: order);
      Get.back();
      response.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
      Get.dialog(ErrorDialog(message: "$e"));
    }
  }
}
