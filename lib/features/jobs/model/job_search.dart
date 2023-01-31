class JobSearchModel {
  String? designation;

  JobSearchModel({this.designation});

  Map<String, dynamic> toJson() {
    return {"designation": designation};
  }
}
