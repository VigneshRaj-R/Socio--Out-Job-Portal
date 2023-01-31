class JobPostModel {
  String? userId;
  String? company;
  String? place;
  String? state;
  String? country;
  String? designation;
  String? jobFor;
  String? expMin;
  String? expMax;
  String? description;
  String? vacancy;
  String? jobType;
  String? salaryMin;
  String? salaryMax;
  String? image;

  JobPostModel({
    this.company,
    this.country,
    this.description,
    this.designation,
    this.expMax,
    this.expMin,
    this.image,
    this.jobFor,
    this.jobType,
    this.place,
    this.salaryMax,
    this.salaryMin,
    this.state,
    this.userId,
    this.vacancy,
  });

  Map<String, dynamic> tojson() {
    return {
      "userId": userId,
      "company": company,
      "place": place,
      "state": state,
      "country": country,
      "description": description,
      "designation": designation,
      "vacancy": vacancy,
      "expMin": expMin,
      "expMax": expMax,
      "image": image,
      "jobFor": jobFor,
      "jobType": jobType,
      "salaryMax": salaryMax,
      "salaryMin": salaryMin,
    };
  }
}
