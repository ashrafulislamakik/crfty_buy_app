class UserModel {

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String city;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.city});

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      avatarUrl: json["avatarUrl"],
      city: json["city"],
    );

  }

  Map<String, dynamic> toJson()  {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "avatarUrl": avatarUrl,
      "city": city,
    };

  }

}