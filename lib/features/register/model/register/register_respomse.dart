class RegisterResponse {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? token;
  bool? loggedin;
  bool? success;
  String? message;
  String? stack;
  num? status;

  RegisterResponse(
      {this.id,
      this.email,
      this.loggedin,
      this.message,
      this.name,
      this.stack,
      this.status,
      this.success,
      this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        message: json["message"] ?? "",
        token: json["token"] ?? "",
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        loggedin: json["loggedin"] ?? false,
        stack: json["stack"] ?? "",
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
      );
}
