import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/get_saved_job.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/services/exception_handel.dart';
import 'package:sociout/services/interseptor.dart';
import 'package:sociout/utils/snackbar.dart';
import 'package:sociout/utils/url.dart';

class GetSavedServices {
  Future<List<GetSaved>?> savedResponse(context) async {
    if (await connectionCheck()) {
      Dio dios = await Interceptorapi().getApiUser();
      try {
        final response = await dios.get(Url().postSave);
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log(" Got saved");
          final data = (response.data as List).map((e) {
            return GetSaved.fromJson(e);
          }).toList();
          return data;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(ShowDialogs.popUp(
              'Something went wrong ! Please try again later'));
          return [];
        }
      } on DioError catch (e) {
        final errormessage = DioException.fromDioError(e).toString();
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp(errormessage));
      } catch (e) {
        return [];
      }
    }
    return null;
  }
}
