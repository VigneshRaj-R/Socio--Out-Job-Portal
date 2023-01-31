import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sociout/features/register/model/login/login_model.dart';
import 'package:sociout/features/register/model/login/login_response.dart';
import 'package:sociout/services/dio_services.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/utils/url.dart';

class LoginServices {
  Future<LoginResponse?> signinServices(LoginModel data) async {
    if (await connectionCheck()) {
      try {
        final response = await DioServices.postFunction(
            url: Url().login, value: data.tojson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('Login Was Successfull');
          log(response.statusCode.toString());
          return LoginResponse.fromJson(response.data);
        } else {
          return LoginResponse(message: "Error while Login");
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          return LoginResponse(message: "Email or Password Was Incorrect");
        }
      } catch (e) {
        log(e.toString());
        return LoginResponse(message: "Something Went Worg");
      }
    } else {
      return LoginResponse(message: "Please check internet connection");
    }
    return null;
  }
}
