
class UserModel {
  final int id;
  final String name;
  final String email;

  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson( json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
