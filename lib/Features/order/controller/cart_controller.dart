import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/order_modle.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addToCart({required ProductModel product, required int quntity});
  sendOrder();
  incre(OrderDetails orderDetilas);
  decre(OrderDetails orderDetilas);
  removeOrder(OrderDetails orderDetilas);
  cancelCart();
}

class CartControllerImpl extends CartController {
  OrderModle? cart;
  List<OrderModle> pendingOrders = [];
  List<OrderModle> orders = [];
  @override
  addToCart({required ProductModel product, required int quntity}) async {
    if (cart == null) {
      cart = OrderModle(
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userId: 0,
        address: addressControllerImpl.address.first.address,
        orderStatusID: 1,
        orderDetails: [
          OrderDetails(
            id: 0,
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString(),
            orderID: 0,
            productID: product.id,
            uintPrice: product.price,
            quntity: quntity,
            product: product,
          ),
        ],
        userNAme: '',
        userEmail: '',
      );
    } else {
      cart?.orderDetails.add(
        OrderDetails(
          id: 0,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
          orderID: 0,
          productID: product.id,
          uintPrice: product.price,
          quntity: quntity,
          product: product,
        ),
      );
    }
    handleSuccess();
    update();
  }

  @override
  cancelCart() async {
    cart = null;
    update();
  }

  clearOrder() {
    cart = null;
    update();
  }

  @override
  decre(OrderDetails orderDetilas) async {
    int index = cart!.orderDetails.indexOf(orderDetilas);
    cart!.orderDetails[index].quntity -= 1;

    update();
  }

  @override
  incre(OrderDetails orderDetilas) async {
    int index = cart!.orderDetails.indexOf(orderDetilas);
    cart!.orderDetails[index].quntity += 1;
    update();
  }

  @override
  removeOrder(OrderDetails orderDetilas) async {
    cart!.orderDetails.remove(orderDetilas);
    update();
  }

  @override
  sendOrder() async {}
}
