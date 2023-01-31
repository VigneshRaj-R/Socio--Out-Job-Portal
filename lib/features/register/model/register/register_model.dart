class RegisterModel {
  String name;
  String email;
  String password;
  String mobile;

  RegisterModel(
      {required this.email,
      required this.name,
      required this.password,
      required this.mobile});

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile
    };
  }
}
