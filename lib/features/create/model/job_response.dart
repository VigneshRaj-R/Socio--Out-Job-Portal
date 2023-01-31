class JobResponseModel {
  bool? success;
  num? status;
  String? message;
  String? stack;

  JobResponseModel({this.message, this.stack, this.status, this.success});

  factory JobResponseModel.fromJson(Map<String, dynamic> json) =>
      JobResponseModel(
        message: json["message"] ?? '',
        success: json["success"] ?? false,
        stack: json["stack"] ?? '',
        status: json["status"] ?? 0,
      );
}
