class AddressModel {
  final int id;
  final String address;
  final String title;
  final bool active;
  final int userId;
  final String createdAt;
  final String updatedAt;

  AddressModel({
    required this.id,
    required this.address,
    required this.title,
    required this.active,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddressModel.fromJson(json) {
    return AddressModel(
      id: json['id'],
      address: json['address'],
      title: json['title'],
      active: json['active'] == 1,
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
  toJson() {
    return {
      "id": id,
      "address": address,
      "title": title,
      "active": active ? 1 : 0,
      "user_id": userId,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
