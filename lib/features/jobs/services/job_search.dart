import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/job_search.dart';
import 'package:sociout/features/jobs/model/job_search_response.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/services/exception_handel.dart';
import 'package:sociout/services/interseptor.dart';
import 'package:sociout/utils/snackbar.dart';
import 'package:sociout/utils/url.dart';

class JobSearchServies {
  Future<ModelSearch> jobSearchRepo(JobSearchModel data, context) async {
    if (await connectionCheck()) {
      Dio dio = await Interceptorapi().getApiUser();

      try {
        final response = await dio.post(Url().search, data: data.toJson());

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log("Search is Working");
          // log(response.toString());
          return ModelSearch.fromJson(response.data);
        } else {
          return ModelSearch(message: "Something went wrong");
          // return JobSearchModelResponse(
          //     message: 'Something went wrong while Search');
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return ModelSearch(message: "Invalid User or Something went wrong");
        } else {
          final errorMessage = DioException.fromDioError(e).toString();
          ScaffoldMessenger.of(context)
              .showSnackBar(ShowDialogs.popUp(errorMessage));
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp("Please check internet connection"));
    }

    return ModelSearch(message: "Something went wrong ! Please try again");
  }
}
