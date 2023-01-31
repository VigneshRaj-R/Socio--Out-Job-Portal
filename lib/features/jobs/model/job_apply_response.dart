import 'dart:convert';

Applyresponse applyresponseFromJson(String str) =>
    Applyresponse.fromJson(json.decode(str));

String applyresponseToJson(Applyresponse data) => json.encode(data.toJson());

class Applyresponse {
  Applyresponse({
    this.applied,
    this.success,
    this.status,
    this.message,
    this.stack,
  });

  bool? applied;
  bool? success;
  int? status;
  String? message;
  String? stack;

  factory Applyresponse.fromJson(Map<String, dynamic> json) => Applyresponse(
        applied: json["applied"],
        success: json["success"],
        status: json["status"],
        message: json["message"],
        stack: json["stack"],
      );

  Map<String, dynamic> toJson() => {
        "applied": applied,
        "success": success,
        "status": status,
        "message": message,
        "stack": stack,
      };
}
