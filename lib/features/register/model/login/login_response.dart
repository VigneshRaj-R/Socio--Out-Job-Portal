// class LoginResponse {
//   String? id;
//   String? name;
//   String? email;
//   String? token;
//   bool? loggedin;
//   String? savedJobs;
//   bool? success;
//   String? message;
//   String? stack;
//   num? status;

//   LoginResponse(
//       {this.id,
//       this.savedJobs,
//       this.email,
//       this.loggedin,
//       this.message,
//       this.name,
//       this.stack,
//       this.status,
//       this.success,
//       this.token});

//   factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//         message: json["message"] ?? "",
//         token: json["token"] ?? "",
//         id: json["_id"] ?? "",
//         name: json["name"] ?? "",
//         savedJobs: json["savedJobs"],
//         email: json["email"] ?? "",
//         loggedin: json["loggedin"] ?? false,
//         stack: json["stack"] ?? "",
//         status: json["status"] ?? 0,
//         success: json["success"] ?? false,
//       );
// }

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.loggedin,
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.savedJobs,
    this.token,
    this.message,
  });

  bool? loggedin;
  String? id;
  String? name;
  String? email;
  int? mobile;
  List<String>? savedJobs;
  String? token;
  String? message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        loggedin: json["loggedin"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        savedJobs: List<String>.from(json["savedJobs"].map((x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "loggedin": loggedin,
        "_id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "savedJobs": List<dynamic>.from(savedJobs!.map((x) => x)),
        "token": token,
      };
}
