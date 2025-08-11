class UserModel {
  final int id;
  final String name;
  final String email;

  final String createdAt;
  final String updatedAt;
  final Profile? profile;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    this.profile,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profile:
          json['profile'] != null ? Profile.fromJson(json['profile']) : null,
    );
  }

  toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "profile": profile?.toJson(),
    };
  }
}

class Profile {
  final int id;
  final String createdAt;
  final String updatedAt;
  final int userId;
  final String? phone;
  final String? birthDay;
  final String fullName;
  String? image;
  final bool gender;

  Profile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    this.image,
    this.phone,
    this.birthDay,
    required this.fullName,
    required this.gender,
  });

  factory Profile.fromJson(json) {
    return Profile(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: json['user_id'],
      phone: json['phone'],
      birthDay: json['barth_day'], // تصحيح كتابة "birth_day"
      fullName: json['full_name'],
      gender: json['gender'] == 1,
      image: json['image'],
    );
  }

  toJson() {
    return {
      "id": id,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "user_id": userId,
      "phone": phone,
      "barth_day": birthDay, // تصحيح كتابة "birth_day"
      "full_name": fullName,
      "gender": gender ? 1 : 0,
      'image': image,
    };
  }
}
