import 'package:food_delivery_front_end/Features/order/controller/order_controller.dart';
import 'package:food_delivery_front_end/core/model/order_modle.dart';
import 'package:get/get.dart';

class AllOrderViewModel {
  AllOrderViewModel() {
    _controllerImpl.showOrder();
  }
  OrderControllerImpl _controllerImpl = Get.find();

  List<OrderModle> get allOrder => _controllerImpl.allOrder;
}
