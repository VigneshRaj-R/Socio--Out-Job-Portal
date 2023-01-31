// // To parse this JSON data, do
//
//     final postedjobsmodel = postedjobsmodelFromJson(jsonString);

import 'dart:convert';

List<Postedjobsmodel> postedjobsmodelFromJson(String str) =>
    List<Postedjobsmodel>.from(
        json.decode(str).map((x) => Postedjobsmodel.fromJson(x)));

String postedjobsmodelToJson(List<Postedjobsmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postedjobsmodel {
  Postedjobsmodel({
    this.id,
    this.userId,
    this.company,
    this.place,
    this.state,
    this.country,
    this.designation,
    this.jobFor,
    this.expMin,
    this.expMax,
    this.description,
    this.vacancy,
    this.jobType,
    this.salaryMin,
    this.salaryMax,
    this.image,
    this.isBlocked,
    this.isOpen,
    this.applicationStatus,
    this.reportMessages,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? userId;
  String? company;
  String? place;
  String? state;
  String? country;
  String? designation;
  String? jobFor;
  int? expMin;
  int? expMax;
  String? description;
  String? vacancy;
  String? jobType;
  double? salaryMin;
  int? salaryMax;
  String? image;
  bool? isBlocked;
  bool? isOpen;
  List<ApplicationStatus>? applicationStatus;
  List<dynamic>? reportMessages;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Postedjobsmodel.fromJson(Map<String, dynamic> json) =>
      Postedjobsmodel(
        id: json["_id"],
        userId: json["userId"],
        company: json["company"],
        place: json["place"],
        state: json["state"],
        country: json["country"],
        designation: json["designation"],
        jobFor: json["jobFor"],
        expMin: json["expMin"],
        expMax: json["expMax"],
        description: json["description"],
        vacancy: json["vacancy"],
        jobType: json["jobType"],
        salaryMin: json["salaryMin"].toDouble(),
        salaryMax: json["salaryMax"],
        image: json["image"],
        isBlocked: json["isBlocked"],
        isOpen: json["isOpen"],
        applicationStatus: List<ApplicationStatus>.from(
            json["applicationStatus"]
                .map((x) => ApplicationStatus.fromJson(x))),
        reportMessages:
            List<dynamic>.from(json["reportMessages"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "company": company,
        "place": place,
        "state": state,
        "country": country,
        "designation": designation,
        "jobFor": jobFor,
        "expMin": expMin,
        "expMax": expMax,
        "description": description,
        "vacancy": vacancy,
        "jobType": jobType,
        "salaryMin": salaryMin,
        "salaryMax": salaryMax,
        "image": image,
        "isBlocked": isBlocked,
        "isOpen": isOpen,
        "applicationStatus":
            List<dynamic>.from(applicationStatus!.map((x) => x.toJson())),
        "reportMessages": List<dynamic>.from(reportMessages!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class ApplicationStatus {
  ApplicationStatus({
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.userId,
    this.appliedAt,
    this.status,
    this.id,
  });

  String? fname;
  String? lname;
  String? email;
  int? phone;
  String? userId;
  DateTime? appliedAt;
  String? status;
  String? id;

  factory ApplicationStatus.fromJson(Map<String, dynamic> json) =>
      ApplicationStatus(
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phone: json["phone"],
        userId: json["userId"],
        appliedAt: DateTime.parse(json["appliedAt"]),
        status: json["status"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone": phone,
        "userId": userId,
        "appliedAt": appliedAt!.toIso8601String(),
        "status": status,
        "_id": id,
      };
}
