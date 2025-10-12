import 'package:food_delivery_front_end/core/model/product_model.dart';

class OrderModle {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  String address;

  int orderStatusID;
  List<OrderDetails> orderDetails;
  String userNAme;
  String userEmail;
  double get totle {
    double _totle = 0;

    for (var details in orderDetails) {
      _totle += details.totle;
    }

    return _totle;
  }

  int get piecesNumber {
    int _totle = 0;

    for (var details in orderDetails) {
      _totle += details.quntity;
    }

    return _totle;
  }

  OrderModle({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.address,
    required this.orderStatusID,
    required this.orderDetails,
    required this.userNAme,
    required this.userEmail,
  });

  factory OrderModle.fromJson(json) {
    final detatils = json['order_detils'] as List;
    return OrderModle(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      userId: json['user_id'],
      address: json['address'],
      orderStatusID: json['orderStatus_id'],
      orderDetails:
          detatils.map<OrderDetails>((e) => OrderDetails.fromJson(e)).toList(),
      userNAme: json['user']['name'],
      userEmail: json['user']['email'],
    );
  }

  toJson() {
    return {
      "id": id,
      "created_at": createdAt.toString(),
      "updated_at": updatedAt.toString(),
      "user_id": userId,
      "address": address,
      "totle": totle,
      "orderStatus_id": orderStatusID,
      "pieces_number": piecesNumber,
      "order_detils": orderDetails.map((e) => e.toJson()).toList(),
    };
  }
}

class OrderDetails {
  int id;
  String createdAt;
  String updatedAt;
  int orderID;
  int productID;
  double uintPrice;
  int quntity;
  ProductModel product;

  OrderDetails({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.orderID,
    required this.productID,
    required this.uintPrice,
    required this.quntity,
    required this.product,
  });

  double get totle {
    return quntity * uintPrice;
  }

  factory OrderDetails.fromJson(json) {
    return OrderDetails(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      orderID: json['order_id'],
      productID: json['product_id'],
      uintPrice: double.parse(json['uint_price'].toString()),
      quntity: json['quntity'],
      product: ProductModel.fromJson(json['product']),
    );
  }

  toJson() {
    return {
      "id": 3,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "order_id": orderID,
      "product_id": productID,
      "uint_price": uintPrice,
      "quntity": quntity,
      "totle": totle,
      'product': product.toJson(),
    };
  }
}
