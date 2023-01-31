// To parse this JSON data, do
//
//     final get = getFromJson(jsonString);

import 'dart:convert';

List<JobSearchModelResponse> getFromJson(String str) =>
    List<JobSearchModelResponse>.from(
        json.decode(str).map((x) => JobSearchModelResponse.fromJson(x)));

class ModelSearch {
  List<JobSearchModelResponse>? listOfSearchResponse;
  String? message;
  ModelSearch({this.listOfSearchResponse, this.message});
  factory ModelSearch.fromJson(List<dynamic> json) {
    return ModelSearch(
      listOfSearchResponse: json == []
          ? []
          : List<JobSearchModelResponse>.from(
              json.map((x) => JobSearchModelResponse.fromJson(x))),
    );
  }
}

class JobSearchModelResponse {
  JobSearchModelResponse(
      {this.id,
      this.userId,
      this.company,
      this.place,
      this.state,
      this.country,
      this.designation,
      this.jobFor,
      this.description,
      this.vacancy,
      this.jobType,
      this.salaryMin,
      this.salaryMax,
      this.applicationStatus,
      this.isBlocked,
      this.isOpen,
      this.reportMessages,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.success,
      this.status,
      this.message,
      this.saved,
      this.image});
  String? success;
  String? status;
  String? message;
  bool? saved;
  String? id;
  String? userId;
  String? company;
  String? place;
  String? state;
  String? country;
  String? image;
  String? designation;
  String? jobFor;
  String? description;
  String? vacancy;
  String? jobType;
  int? salaryMin;
  int? salaryMax;
  List<dynamic>? applicationStatus;
  bool? isBlocked;
  bool? isOpen;
  List<dynamic>? reportMessages;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory JobSearchModelResponse.fromJson(Map<String, dynamic> json) =>
      JobSearchModelResponse(
        image: json["image"],
        saved: json["saved"],
        success: json["success"],
        status: json["status"],
        message: json["message"],
        id: json["_id"],
        userId: json["userId"],
        company: json["company"],
        place: json["place"],
        state: json["state"],
        country: json["country"],
        designation: json["designation"],
        jobFor: json["jobFor"],
        description: json["description"],
        vacancy: json["vacancy"],
        jobType: json["jobType"],
        salaryMin: json["salaryMin"],
        salaryMax: json["salaryMax"],
        applicationStatus:
            List<dynamic>.from(json["applicationStatus"].map((x) => x)),
        isBlocked: json["isBlocked"],
        isOpen: json["isOpen"],
        reportMessages:
            List<dynamic>.from(json["reportMessages"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  toJson() {}
}
