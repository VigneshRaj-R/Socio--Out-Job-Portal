import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sociout/features/create/model/job_post.dart';
import 'package:sociout/features/create/model/job_response.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/services/interseptor.dart';
import 'package:sociout/utils/url.dart';

class JobCreateServices {
  Future<JobResponseModel?> jobPostServices(JobPostModel data) async {
    Dio dios = await Interceptorapi().getApiUser();
    if (await connectionCheck()) {
      try {
        Response response = await dios.post(Url().jobPost, data: data.tojson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('data added succesfully');
          return JobResponseModel.fromJson(response.data);
        } else {
          return JobResponseModel(message: 'Something Went Wrong');
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          return JobResponseModel(message: 'Invalid data');
        }
      } catch (e) {
        return JobResponseModel(message: 'Something went wrong');
      }
    } else {
      return JobResponseModel(message: 'Please connect to internet');
    }

    return null;
  }
}
