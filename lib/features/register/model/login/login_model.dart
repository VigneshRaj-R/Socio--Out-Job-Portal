class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> tojson() {
    return {"email": email, "password": password};
  }
}
