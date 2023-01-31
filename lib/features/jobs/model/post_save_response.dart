class JobSaveResponseModel {
  bool? saved;
  String? success;
  String? status;
  String? message;
  String? stack;

  JobSaveResponseModel(
      {this.message, this.saved, this.stack, this.status, this.success});

  factory JobSaveResponseModel.fromJson(Map<String, dynamic> json) =>
      JobSaveResponseModel(
          message: json["message"] ?? '',
          saved: json["saved"] ?? false,
          stack: json["stack"] ?? '',
          status: json["status"] ?? '',
          success: json["success"] ?? '');
}
