import 'package:food_delivery_front_end/core/Server/root_link.dart';

class ProductModel {
  int id;
  String createdAt;
  String name;
  String image;
  String description;
  int categoryId;
  double price;
  double deliveryPrice;
  String makeTime;
  double averageRating;
  String category;
  String categoryImage;

  ProductModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.image,
    required this.description,
    required this.categoryId,
    required this.price,
    required this.deliveryPrice,
    required this.makeTime,
    required this.averageRating,
    required this.category,
    required this.categoryImage,
  });

  // from JSON
  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      categoryId: json['category_id'],
      price: json['price']?.toDouble() ?? 0.0,
      deliveryPrice: json['delivery_price']?.toDouble() ?? 0.0,
      makeTime: json['make_time'],
      averageRating: json['average_rating']?.toDouble() ?? 0.0,
      category: json['category'] ?? "",
      categoryImage: json['category_image'] ?? "",
    );
  }

  // to JSON
  toJson() {
    return {
      "id": id,
      "created_at": createdAt,
      "name": name,
      "image": image,
      "description": description,
      "category_id": categoryId,
      "price": price,
      "delivery_price": deliveryPrice,
      "make_time": makeTime,
      "average_rating": averageRating,
      "category": category,
      "category_image": categoryImage,
    };
  }

  String get fullImageUrl {
    return "$storage/$image";
  }
}
