class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool emailVerified;
  final String phone;
  final bool phoneVerified;
  final String avatarUrl;
  final String city;
  final int role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.phoneVerified,
    required this.avatarUrl,
    required this.city,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"]?.toString() ?? "",
      firstName: json["first_name"]?.toString() ?? "",
      lastName: json["last_name"]?.toString() ?? "",
      email: json["email"]?.toString() ?? "",
      emailVerified: json["email_verified"] ?? false,
      phone: json["phone"]?.toString() ?? "",
      phoneVerified: json["phone_verified"] ?? false,
      avatarUrl: json["avatar_url"]?.toString() ?? "",
      city: json["city"]?.toString() ?? "",
      role: json["role"] is int
          ? json["role"]
          : int.tryParse(json["role"]?.toString() ?? "0") ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "email_verified": emailVerified,
      "phone": phone,
      "phone_verified": phoneVerified,
      "avatar_url": avatarUrl,
      "city": city,
      "role": role,
    };
  }
}