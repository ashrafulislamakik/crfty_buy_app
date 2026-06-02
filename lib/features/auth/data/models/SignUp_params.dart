class SignUpParams {

  final String first_name;
  final String last_name;
  final String email;
  final String phone;
  final String city;
  final String password;

  SignUpParams({

    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone,
    required this.city,
    required this.password});

  Map<String, dynamic> toJson() {

    return {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'phone': phone,
      'city': city,
      'password': password,
    };
  }
}