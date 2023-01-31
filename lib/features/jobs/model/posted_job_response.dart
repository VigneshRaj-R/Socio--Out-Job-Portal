import 'dart:convert';

Postedjobsresponse postedjobsresponseFromJson(String str) =>
    Postedjobsresponse.fromJson(json.decode(str));

class Postedjobsresponse {
  Postedjobsresponse({
    this.success,
    this.status,
    this.message,
  });

  bool? success;
  int? status;
  String? message;

  factory Postedjobsresponse.fromJson(Map<String, dynamic> json) =>
      Postedjobsresponse(
        success: json["success"],
        status: json["status"],
        message: json["message"],
      );
}
