import 'dart:convert';

Applymodel applymodelFromJson(String str) =>
    Applymodel.fromJson(json.decode(str));

String applymodelToJson(Applymodel data) => json.encode(data.toJson());

class Applymodel {
  Applymodel(
      {this.jobId,
      this.fname,
      this.userId,
      this.lname,
      this.email,
      this.phone,
      this.experience,
      this.resume,
      this.status,
      this.qualification});

  String? jobId;
  String? userId;
  String? qualification;
  String? fname;
  String? lname;
  String? status;
  String? email;
  String? phone;
  String? experience;
  String? resume;

  factory Applymodel.fromJson(Map<String, dynamic> json) => Applymodel(
        jobId: json["jobId"],
        userId: json["userId"],
        fname: json["fname"],
        qualification: json["qualification"],
        lname: json["lname"],
        email: json["email"],
        phone: json["phone"],
        experience: json["experience"],
        resume: json["resume"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "userId": userId,
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone": phone,
        "experience": experience,
        "resume": resume,
        "status": status,
      };
}
