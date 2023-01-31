import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/post_save.dart';
import 'package:sociout/features/jobs/model/post_save_response.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/services/exception_handel.dart';
import 'package:sociout/services/interseptor.dart';
import 'package:sociout/utils/snackbar.dart';
import 'package:sociout/utils/url.dart';

class JobSaveServices {
  Future<JobSaveResponseModel?> saveServices(JobSaveModel data, context) async {
    if (await connectionCheck()) {
      Dio dios = await Interceptorapi().getApiUser();
      try {
        Response response =
            await dios.post(Url().postSave, data: data.toJson());

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return JobSaveResponseModel.fromJson(response.data);
        } else {
          return JobSaveResponseModel(
              message: "Something went wrong while Save");
        }
      } on DioError catch (e) {
        final eMessage = DioException.fromDioError(e).toString();
        ScaffoldMessenger.of(context).showSnackBar(ShowDialogs.popUp(eMessage));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please check interent Connection'));
    }
    return null;
  }
}
