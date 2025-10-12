import 'package:food_delivery_front_end/core/model/order_modle.dart';

class OrderDetalisViewModel {
  final OrderModle order;
  String title = "Order Details";

  String orderStatusLable = "Order status";
  String productsLable = "Required items";
  String invoiceTotalLable = "Total bill";
  String orderNumberLable = "Order Number";
  String uponReceiptLable = "Upon receipt";
  String deliveryAddressLable = "Delivery address";

  OrderDetalisViewModel({required this.order});

  List<OrderDetails> get items => order.orderDetails;
}
