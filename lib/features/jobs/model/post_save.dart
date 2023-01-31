class JobSaveModel {
  String? jobId;

  JobSaveModel({this.jobId});

  Map<String, dynamic> toJson() {
    return {"jobId": jobId};
  }
}
