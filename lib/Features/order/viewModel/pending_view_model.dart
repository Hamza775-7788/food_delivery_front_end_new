import 'package:food_delivery_front_end/Features/order/controller/order_controller.dart';
import 'package:food_delivery_front_end/core/model/order_modle.dart';
import 'package:get/get.dart';

class PendingViewModel {

PendingViewModel(){
  _controllerImpl.showWithStats(statusID: 1) ;
}

  OrderControllerImpl _controllerImpl = Get.find();

  List<OrderModle> get pendingOrders => _controllerImpl.pending; 
}
