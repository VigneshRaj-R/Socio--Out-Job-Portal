import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/job_apply_model.dart';
import 'package:sociout/features/jobs/model/job_apply_response.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/services/exception_handel.dart';
import 'package:sociout/services/interseptor.dart';
import 'package:sociout/utils/snackbar.dart';
import 'package:sociout/utils/url.dart';

class JobApplyServices {
  Future<Applyresponse?> jobapplyRepo(Applymodel data, context) async {
    if (await connectionCheck()) {
      Dio dio = await Interceptorapi().getApiUser();

      try {
        Response response = await dio.post(Url().jobApply, data: data.toJson());

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('Job Apply Done');
          return Applyresponse.fromJson(response.data);
        } else {
          return Applyresponse(message: 'Something went wrong');
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
