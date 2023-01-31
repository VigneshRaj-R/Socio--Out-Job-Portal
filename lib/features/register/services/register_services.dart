import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sociout/features/register/model/register/register_model.dart';
import 'package:sociout/features/register/model/register/register_respomse.dart';
import 'package:sociout/services/dio_services.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/utils/url.dart';

class RegisterServices {
  Future<RegisterResponse?> signupServices(RegisterModel data) async {
    if (await connectionCheck()) {
      try {
        final response = await DioServices.postFunction(
            url: Url().register, value: data.tojson());

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('Login Successful.......................');
          return RegisterResponse.fromJson(response.data);
        } else {
          return RegisterResponse.fromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          return RegisterResponse(message: 'User already exists');
        }
      } catch (e) {
        return RegisterResponse(message: 'Something Went Worng........');
      }
    } else {
      return RegisterResponse(message: "Please check the internet connection");
    }
    return null;
  }
}
